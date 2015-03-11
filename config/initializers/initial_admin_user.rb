# ActiveSupport.on_load(:active_record) do
#   if email = ENV['TAZA_ADMIN_EMAIL']
#     user = User.find_by(email: email)
#     user.grant_admin_role
#   end
# end

admin_initializer = AdminInitializer.new
admin_initializer.grant_admin_access
