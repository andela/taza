class AdminInitializer
  def grant_admin_access
    email = ENV['TAZA_ADMIN_EMAIL']
    unless email
    raise 'Default admin user not set as environment variable, set TAZA_ADMIN_EMAIL as environment variable'
    end
    user = User.find_by(email: email)
    unless user.present?
      user = User.create!(email: email)
    end
    user.add_role :admin
  end
end