class Api::UsersController < AuthApplicationController

  # Constants
  CLASS_NAME = "Api::UsersController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  def update
    current_user
      .update(
        last_name: update_params[:last_name],
        first_name: update_params[:first_name],
        birthday: update_params[:birthday],
      )
    applicant = current_user.applicant
    applicant.
      update(
        briefcase: update_params[:briefcase],
        youtube: update_params[:youtube],
        description: update_params[:description],
        phone: update_params[:phone],
        linkedin: update_params[:linkedin],
      )
    render json: { status: "success", message: "Usuario actualizado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "create", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok

  end

  def update_establishment
    current_establishment.update(establishment_params)
    render json: { status: "success", message: "Establecimiento actualizado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "update_establishment", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok

  end

  def update_params
    params
      .permit(
        :last_name,
        :first_name,
        :email,
        :dni,
        :birthday,
        :briefcase,
        :youtube,
        :description,
        :phone,
        :linkedin,
      )
  end

  def establishment_params
    params
      .permit(
        :dni,
        :phone,
        :name,
        :address
      )
  end

end
