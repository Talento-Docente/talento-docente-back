class Api::SkillsController < AuthApplicationController
  # Includes
  include RestHelper

  # Constants
  CLASS_NAME = "Api::SkillsController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  def index
    params.permit(:skill)
    skills = Skill
               .where(params[:skill].present? ? "upper(skill) like '%#{params[:skill].to_s.strip.upcase}%'": "")
               .limit(20)

    render json: { status: "success", message: "success get", skills: skills }, status: :ok

  rescue StandardError => e
    LOG.error(method: "index", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def create
    params.permit(:reference_id, :reference_type, skills: [])
    reference_id = params[:reference_id]
    reference_type = params[:reference_type]
    skills = params[:skills]

    created_skills = []
    skills.each do |skill|
      created_skills.push Skill.find_or_create_by(skill: skill)
    end
    reference_type.to_s.singularize.classify.constantize.find(reference_id).skills = created_skills

    render json: { status: "success", message: "success create" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "create", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

end
