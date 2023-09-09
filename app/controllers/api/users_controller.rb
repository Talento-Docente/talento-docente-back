class Api::UsersController < AuthApplicationController

  # Constants
  CLASS_NAME = "Api::UsersController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  def upload_file
    params.permit(:document_name, :file)

    if params[:document_name] === 'picture'
      current_user.update(picture: params[:file])

    elsif params[:document_name] === 'curriculum'
      current_user.applicant.update(curriculum: params[:file])

    else
      raise StandardError, "Tipo de documento no especificado"

    end

    render json: { status: "success", message: "Archivo cargado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "upload_file", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :internal_server_error
  end

  def delete_file
    params.permit(:document_name)

    if params[:document_name] === 'picture'
      current_user.picture.purge if current_user.picture.present?

    elsif params[:document_name] === 'curriculum'
      current_user.applicant.curriculum.purge if current_user.applicant.curriculum.present?

    else
      raise StandardError, "Tipo de documento no especificado"

    end

    render json: { status: "success", message: "Archivo eliminado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "delete_file", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :internal_server_error
  end

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

  def upload_establishment_file
    params.permit(:document_name, :file)

    if params[:document_name] === 'picture'
      result = current_establishment.update(picture: params[:file])
      puts "result: #{result.inspect}"
    else
      raise StandardError, "Tipo de documento no especificado"

    end

    render json: { status: "success", message: "Archivo cargado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "upload_establishment_file", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :internal_server_error

  end

  def delete_establishment_file
    params.permit(:document_name)

    if params[:document_name] === 'picture'
      current_establishment.picture.purge if current_establishment.picture.present?

    else
      raise StandardError, "Tipo de documento no especificado"

    end

    render json: { status: "success", message: "Archivo eliminado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "delete_establishment_file", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :internal_server_error
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
