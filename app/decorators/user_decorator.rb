class UserDecorator < Draper::Decorator
  delegate_all

  def assigned_roles
    capitalized_roles.join(', ')
  end

  private
  def sorted_roles
    roles.order(:name)
  end

  def capitalized_roles
    sorted_roles.decorate.map(&:capitalized_name)
  end
end