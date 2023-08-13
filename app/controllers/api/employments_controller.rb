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
      required_parent_model: false,
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
            :description
          ]
        ]
      )
  end

end
