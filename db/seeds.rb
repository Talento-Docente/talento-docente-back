##
# Creación de usuario administrador para ambiente de pruebas
if Rails.env.development?
  user = User.find_or_initialize_by(name: 'Admin', email: 'admin@example.com')
  user.dni = "".rut_generate
  user.password = "password"
  user.password_confirmation = "password"
  user.confirmed_at = DateTime.now
  puts "create admin user: #{user.save}"

  unless user.save
    puts "errors: #{user.errors.full_messages}"
  end

  Applicant.find_or_create_by(user: user)
  establishment = Establishment.find_or_create_by(
    address: "Dirección de Prueba",
    dni: "773382867",
    name: "Talento Docente",
    phone: "56966777974",
  )

  Permission.find_or_create_by(establishment: establishment, user: user, permission: Permission::PERMISSION_OWNER)

end
