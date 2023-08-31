class Api::PostulationsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::TestsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy, :activities]

  def activities
    postulation_activities = []
    postulation = @_element
    stage = postulation.stage
    employment = postulation.employment

    stage_configuration = StageConfiguration.where(stage_id: postulation.stage.id, employment_id: employment.id).first
    stage_configuration_references = stage_configuration&.stage_configuration_references
    if stage_configuration_references.present? && stage_configuration_references.any?
      stage_configuration_references.each do |stage_configuration_reference|
        postulation_activity = PostulationActivity.find_or_create_by(
          postulation: postulation,
          stage_configuration_reference: stage_configuration_reference,
        )
        postulation_activity.reference_type = stage_configuration_reference.reference_type
        postulation_activity.save

        postulation_activities.push(
          {
            stage_configuration_reference: stage_configuration_reference,
            resource: stage_configuration_reference&.resource,
            postulation: postulation,
            postulation_activity: postulation_activity,
            stage_configuration: stage_configuration
          }
        )

      end
    end
    render json: { status: "success", message: "success find or create", postulation_activities: postulation_activities }, status: :ok
  rescue => e
    LOG.error(method: "activities", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

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
