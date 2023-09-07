module RestHelper
  include ActiveSupport::Concern

  attr_reader :_params,
              :_model,
              :_excluded,
              :_element,
              :_log,
              :_search_params,
              :_element_params,
              :_services,
              :_current_user,
              :_required_parent_model,
              :_parent_model,
              :_search_text_params,
              :_create_with_parent

  def prepare_search(model:,
                     class_name: "",
                     element_params: nil,
                     services: [],
                     params: nil,
                     search_params: nil,
                     current_user: nil,
                     required_parent_model: false,
                     parent_model: nil,
                     create_with_parent: false,
                     excluded: [],
                     search_text_params: nil)
    @_model = model
    @_log = LoggerService.new(class_name: "#{class_name}::RestHelper")
    @_params = params
    @_excluded = excluded
    @_search_params = search_params
    @_element_params = element_params
    @_services = services
    @_current_user = current_user
    @_required_parent_model = required_parent_model
    @_parent_model = parent_model
    @_search_text_params = search_text_params
    @_create_with_parent = create_with_parent
  end

  def search_params
    _params
      .permit(
        :page,
        :page_size,
        :sort_order,
        :sort_field,
        search_by: []
      )
  end

  def search
    set_order
    set_size
    run
  end

  def set_element
    if _required_parent_model
      @_element = _parent_model
                    .send(_model.name.snakecase.pluralize)
                    .where(id: params[:id]).first
    else
      @_element = _model.where(id: params[:id]).first
    end
  end

  def valid_service?(service: "")
    _services.index(service).present?
  end

  def map_errors(errors)
    errors.messages.map do |key, value|
      { key: key.to_s, key_snakecase: key.to_s.camelcase(:lower), message: value }
    end if errors.present? && errors.messages.present?
  end

  def show_error(error:)
    if error.present?
      puts error.backtrace
    end
  end

  # Index

  def set_order
    if _params[:sort_field].nil? && _params[:sort_order].nil?
      _params[:sort_field] = "#{_model.name.snakecase.pluralize}.id"
      _params[:sort_order] = "desc"
    end
  end

  def set_size
    _params[:page_size] = 10 if _params[:page_size].nil? || _params[:page_size].to_i == 0
  end

  def run
    (_params[:search_by].present? ? search_by : all)
      .page(_params[:page]).per(_params[:page_size])
      .order("#{_params[:sort_field]} #{_params[:sort_order]}")
  end

  def search_by
    if _search_text_params.present? && _params[:search_by][:search_text].present?
      search_text = _params[:search_by][:search_text].to_s.strip.upcase
      @search_text_query = ""
      _search_text_params.each_with_index { |attribute, index|
        @search_text_query += "upper(#{attribute}) like '%#{search_text}%'"
        if (index < _search_text_params.length - 1)
          @search_text_query += " or "
        end
      }

      puts "@search_text_query: #{@search_text_query}"
    end

    if _required_parent_model
      _parent_model
        .send(_model.name.snakecase.pluralize)
        .where(@search_text_query.present? ? @search_text_query : "")
        .where(JSON.parse(_params[:search_by].except(*_excluded).to_json))
    else
      _log.info(
        method: "search_by",
        message: "#{_model.name} params: #{_params[:search_by].except(*_excluded)}")
      _model
        .where(@search_text_query.present? ? @search_text_query : "")
        .where(JSON.parse(_params[:search_by].except(*_excluded).to_json))
    end
  end

  def all
    if _required_parent_model
      t = _parent_model
        .send(_model.name.snakecase.pluralize)
        .all
      puts "all_query: #{t.to_sql}"
      t
    else
      _model
        .all
    end
  end

  def before_index_method
  end

  def index
    raise ParamsErrors::ServiceNotRegister unless valid_service?(service: "index")
    before_index_method
    _log.info(method: "index", message: "search_params: #{_search_params.inspect}")
    @items = search
    render json: @items,
           meta: paginate(@items),
           adapter: :json,
           view_data_method: _search_params.present? && _search_params[:view_data_method].present? ? _search_params[:view_data_method] : 'index'
  rescue ParamsErrors::ParamsNotFound, ParamsErrors::ModelNotFound => e
    _log.error(method: "index", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: :ok

  rescue => e
    _log.error(method: "index", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: :ok
  end

  # Show

  def before_show_method
  end

  def show
    raise ParamsErrors::ServiceNotRegister unless valid_service?(service: "show")
    raise ParamsErrors::NotFound unless _element.present?
    before_show_method

    render json: _element, adapter: :attributes, view_data_method: _search_params.present? && _search_params[:view_data_method].present? ? _search_params[:view_data_method] : 'show'

  rescue ParamsErrors::NotFound => e
    _log.error(method: "update", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: 404

  rescue => e
    _log.error(method: "show", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, adapter: :json, status: :ok
  end

  # Update

  def before_update_method
  end

  def update
    raise ParamsErrors::ServiceNotRegister unless valid_service?(service: "update")
    raise ParamsErrors::NotFound unless _element.present?
    before_update_method
    if _element.update(_element_params)
      render json: { message: 'success update', status: "success", "#{_model.name.snakecase}": _element }, adapter: :attributes
    else
      render json: { message: 'Error al actualizar', status: "error", errors: map_errors(_element.errors) }, adapter: :attributes
    end

  rescue ParamsErrors::NotFound => e
    _log.error(method: "update", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: 404

  rescue => e
    _log.error(method: "update", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: :ok
  end

  # Create

  def before_create_method
  end

  def create
    raise ParamsErrors::ServiceNotRegister unless valid_service?(service: "create")
    before_create_method
    if _required_parent_model
      if @_create_with_parent
        @element = _model.create(_element_params.merge({ "#{_parent_model.class.name.snakecase}_id": _parent_model.id }))
      else
        @element = _model.create(_element_params)
      end
      if @element.save
        render json: { message: 'success create', status: "success", "#{_model.name.snakecase}": @element }, adapter: :attributes
      else
        render json: { message: 'Error al crear', status: "error", errors: map_errors(@element.errors) }, adapter: :attributes
      end

    else
      @element = _model.create(_element_params)
      if @element.save
        render json: { message: 'success create', status: "success", "#{_model.name.snakecase}": @element }, adapter: :attributes
      else
        render json: { message: 'Error al crear', status: "error", errors: map_errors(@element.errors) }, adapter: :attributes
      end
    end

  rescue ParamsErrors::NotFound => e
    _log.error(method: "create", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: 404

  rescue => e
    _log.error(method: "create", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: :ok

  end

  # Destroy

  def before_destroy_method
  end

  def destroy
    raise ParamsErrors::ServiceNotRegister unless valid_service?(service: "destroy")
    raise ParamsErrors::NotFound unless _element.present?
    before_destroy_method
    if _element.destroy
      render json: { message: 'success destroy', status: "success" }, adapter: :attributes
    else
      render json: { message: 'Error al eliminar', status: "error" }, adapter: :attributes
    end

  rescue ParamsErrors::NotFound => e
    _log.error(method: "destroy", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: 404

  rescue => e
    _log.error(method: "destroy", message: "error response %s" % e.message)
    show_error(error: e)
    render json: { status: "error", message: e.message }, status: :ok
  end

end
