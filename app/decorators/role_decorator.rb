class RoleDecorator < Draper::Decorator
  delegate_all

  def capitalized_name
    name.capitalize
  end
end