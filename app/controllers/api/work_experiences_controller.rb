class Api::WorkExperiencesController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::WorkExperiencesController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy]

  def init_search_helper
    puts "current_user: #{current_user.inspect}"
    prepare_search(
      model: WorkExperience,
      class_name: CLASS_NAME,
      params: params,
      search_params: search_params,
      element_params: element_params,
      services: %w[index show update create destroy],
      current_user: current_user,
      required_parent_model: true,
      parent_model: current_user,
      create_with_parent: false,
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
          :business_name,
          :description,
          :end_date,
          :job_title,
          :start_date,
          :applicant_id
        ]
      )
  end

  def element_params
    params
      .permit(
        :id,
        :business_name,
        :description,
        :end_date,
        :job_title,
        :start_date,
        :applicant_id
      )
  end

end
