module RolesHelper
  def role_checked? role
    @role_names.include?(role)
  end
end