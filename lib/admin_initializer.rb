class AdminInitializer
  def grant_admin_access
    if email = ENV['TAZA_ADMIN_EMAIL']
      user = User.find_by(email: email)
      user.try(:grant_admin_role)
    end
  end
end
