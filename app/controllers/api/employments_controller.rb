class Api::EmploymentsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::EmploymentsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy]

  def resume
    resume = {
      "#{Employment::STATUS_CREATED}": current_establishment.employments.where(status: Employment::STATUS_CREATED).count,
      "#{Employment::STATUS_IN_PROGRESS}": current_establishment.employments.where(status: Employment::STATUS_IN_PROGRESS).count,
      "#{Employment::STATUS_CLOSED}": current_establishment.employments.where(status: Employment::STATUS_CLOSED).count
    }

    render json: { status: "success", message: "success get", resume: resume }, status: :ok

  rescue => e
    LOG.error(method: "index", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def init_search_helper
    prepare_search(
      model: Employment,
      class_name: CLASS_NAME,
      params: params,
      search_params: search_params,
      element_params: element_params,
      services: %w[index show update create destroy],
      current_user: current_user,
      required_parent_model: true,
      parent_model: current_establishment,
      excluded: [:search_text],
      search_text_params: %w[employments.title employments.description]
    )
  end

  def search_params
    params
      .permit(
        :page,
        :page_size,
        :sort_order,
        :sort_field,
        search_by: [
          :search_text,
          :description,
          :employment_type,
          :end_date,
          :hours,
          :qualification,
          :salary,
          :schedule_type,
          :start_date,
          :status,
          :title,
          :flow_id,
          :establishment_id
        ]
      )
  end

  def element_params
    params
      .permit(
        :description,
        :employment_type,
        :end_date,
        :hours,
        :qualification,
        :salary,
        :schedule_type,
        :start_date,
        :status,
        :title,
        :establishment_id,
        :flow_id,
        stage_configurations_attributes: [
          :id,
          :_destroy,
          :date_end,
          :meet_date,
          :meet_url,
          :employment_id,
          :stage_id,
          stage_configuration_references_attributes: [
            :id,
            :_destroy,
            :name,
            :description,
            :resource_id,
            :resource_type
          ]
        ]
      )
  end

end
