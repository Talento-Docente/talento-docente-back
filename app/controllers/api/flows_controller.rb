class Api::FlowsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::FlowsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy]

  private

  def init_search_helper
    prepare_search(
      model: Flow,
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
          :name,
          :description,
          :establishment_id
        ]
      )
  end

  def element_params
    params
      .permit(
        :id,
        :name,
        :description,
        :establishment_id,
        stages_attributes: [
          :id,
          :_destroy,
          :description,
          :name,
          :stage_type,
          :order_number,
          :flow_id
        ]
      )
  end



end
