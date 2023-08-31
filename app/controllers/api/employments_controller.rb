class Api::EmploymentsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::EmploymentsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  # Scopes
  before_action :init_search_helper
  before_action :set_element, only: [:show, :update, :destroy, :applicants, :find_or_create_postulation]

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

  def applicants
    applicants = User
                   .select('users.id, users.first_name, users.last_name')
                   .select('stages.id as stage_id, stages.name as stage_name')
                   .select('applicants.id as applicant_id')
                   .select('postulations.id as postulation_id')
                   .joins(applicant: [postulations: [:stage, :employment]])
                   .where(employments: { id: @_element.id })

    render json: { status: "success", message: "success get", applicants: applicants }, status: :ok

  rescue => e
    LOG.error(method: "applicants", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def find_or_create_postulation
    params.permit(:email, :first_name, :last_name)

    user = User.find_or_create_by(email: params[:email])
    if user.new_record?
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.save
    end
    applicant = Applicant.find_or_create_by(user: user)

    first_stage = @_element.flow.stages.order(order_number: :asc).first

    postulation = Postulation.find_or_create_by(
      employment: @_element,
      applicant: applicant,
      stage: first_stage,
    )

    render json: { status: "success", message: "success find or create", postulation: postulation }, status: :ok
  rescue => e
    LOG.error(method: "find_or_create_postulation", message: "error response %s" % e.message)
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
          :establishment_id,
          :visible
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
        :visible,
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
            :reference_type,
            :resource_id,
            :resource_type
          ]
        ]
      )
  end

end
