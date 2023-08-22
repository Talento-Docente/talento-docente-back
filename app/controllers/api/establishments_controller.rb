class Api::EstablishmentsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::EstablishmentsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update]

  private

  def init_search_helper
    prepare_search(
      model: Establishment,
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
          :address,
          :name,
          :phone,
          :dni
        ]
      )
  end

  def element_params
    params
      .permit(
        :id,
        :address,
        :name,
        :phone,
        :dni
      )
  end



end
