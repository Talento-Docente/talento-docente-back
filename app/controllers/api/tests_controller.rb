class Api::TestsController < AuthApplicationController
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
      model: Test,
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
          :id,
          :description,
          :name,
          :time_type,
          :time_value,
          :establishment_id
        ]
      )
  end

  def element_params
    params
      .permit(
        :id,
        :description,
        :name,
        :time_type,
        :time_value,
        :establishment_id,
        questions_attributes: [
          :id,
          :_destroy,
          :group,
          :hint,
          :order_number,
          :question,
          :question_type,
          :value,
          :test_id,
          alternatives_attributes: [
            :id,
            :_destroy,
            :description,
            :hint,
            :key,
            :value,
            :question_id
          ]
        ]
      )
  end



end
