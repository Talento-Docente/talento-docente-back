
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
end


# PLDY 14
