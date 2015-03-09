ActiveSupport.on_load(:active_record) do
  if email = ENV['TAZA_ADMIN_EMAIL']
    user = User.first_or_create!(email: email)
    user.grant_admin_role
  end
end