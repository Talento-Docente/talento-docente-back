module SerializerHelper
  def view_data_method
    @instance_options[:view_data_method].present? ? @instance_options[:view_data_method] : 'show'
  end

  def show_method?
    view_data_method === 'show'
  end

  def index_method?
    view_data_method === 'index'
  end

end
