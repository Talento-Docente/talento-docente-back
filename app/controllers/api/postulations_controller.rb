class Api::PostulationsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::TestsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy]

  def init_search_helper
    prepare_search(
      model: Postulation,
      class_name: CLASS_NAME,
      params: params,
      search_params: search_params,
      element_params: element_params,
      services: %w[index show update create destroy],
      current_user: current_user,
      required_parent_model: true,
      parent_model: current_establishment.present? ? current_establishment : current_user,
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
          :id,
          :applicant_id,
          :employment_id,
          :stage_id
        ]
      )
  end

  def element_params
    params
      .permit(
        :id,
        :applicant_id,
        :employment_id,
        :stage_id
      )
  end



end
