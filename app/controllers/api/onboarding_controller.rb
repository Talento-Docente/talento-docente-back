class Api::OnboardingController < AuthApplicationController

  skip_before_action :authenticate_user!, only: [
    :validate_user_email,
    :validate_user_dni,
    :validate_establishment_dni,
    :create
  ]

  # Constants
  CLASS_NAME = "Api::OnboardingController"
  LOG = LoggerService.new(class_name: CLASS_NAME)

  def validate_user_email
    params.permit(:email)
    email = params[:email]
    raise StandardError, "Email no especificado" unless email.present?

    user = User.where("lower(users.email) = ?", email.to_s.strip.downcase)
    raise StandardError, "Usuario encontrado" if user.present?

    render json: { status: "success", message: "Usuario no encontrado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "validate_user_email", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def validate_user_dni
    params.permit(:dni)
    dni = params[:dni]
    raise StandardError, "Dni no especificado" unless dni.present?

    user = User.where("lower(users.dni) = ?", dni.to_s.strip.downcase)
    raise StandardError, "Usuario encontrado" if user.present?

    render json: { status: "success", message: "Usuario no encontrado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "validate_user_dni", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def validate_establishment_dni
    params.permit(:dni)
    dni = params[:dni]
    raise StandardError, "Dni no especificado" unless dni.present?

    user = Establishment.where("lower(establishments.dni) = ?", dni.to_s.strip.downcase)
    raise StandardError, "Establecimiento encontrado" if user.present?

    render json: { status: "success", message: "Establecimiento no encontrado" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "validate_establishment_dni", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def create
    register_type = create_params[:register_type]
    raise StandardError, 'Registro erróneo' unless register_type.present?

    user_params = create_params[:user]
    user = User.create(user_params.merge(confirmed_at: DateTime.now))
    puts "user: #{user.inspect}"

    applicant = Applicant.create(user: user)
    puts "applicant: #{applicant.inspect}"

    if register_type === 'establishment'
      establishment_params = create_params[:establishment]
      establishment = Establishment.create(establishment_params)
      puts "establishment: #{establishment.inspect}"
      Permission.create(user: user, establishment: establishment, permission: Permission::PERMISSION_OWNER)

      user.role = User::ROLE_ESTABLISHMENT
    else

      user.role = User::ROLE_APPLICANT
    end
    user.save

    render json: { status: "success", message: "Usuario creado exitosamente" }, status: :ok

  rescue StandardError => e
    LOG.error(method: "create", message: "error response %s" % e.message)
    render json: { status: "error", message: e.message }, status: :ok
  end

  def create_params
    params
      .permit(
        :register_type,
        user: [
          :name,
          :last_name,
          :first_name,
          :email,
          :dni,
          :birthday,
          :password,
          :password_confirmation,
        ],
        establishment: [
          :dni,
          :name,
          :address,
          :phone,
        ]
      )
  end

end
