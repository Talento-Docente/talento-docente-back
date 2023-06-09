class Api::EmploymentsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::EmploymentsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy]

  private

  def init_search_helper
    prepare_search(
      model: Employment,
      class_name: CLASS_NAME,
      params: params,
      search_params: search_params,
      element_params: element_params,
      services: %w[index show update create destroy],
      current_user: current_user,
      required_establishment: false,
      excluded: []
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
          :description,
          :employment_type,
          :end_date,
          :hours,
          :qualification,
          :salary,
          :schedule_type,
          :start_date,
          :status,
          :title
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
        :title
      )
  end



end
