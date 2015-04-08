class RolesController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def edit_multiple
    @users_ids = params[:users_ids]
    @role_names = User.unique_roles(@users_ids)
    @roles = Role::ROLE_NAMES
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_multiple
    params[:role_names] ||= []
    User.update_roles(params[:users_ids], params[:role_names], current_user)
    if params[:users_ids].include?(current_user.id.to_s) && !params[:role_names].include?('admin')
      redirect_to admin_users_path, alert: 'You cannot remove your own admin privileges!'
    else
      redirect_to admin_users_path, notice: 'Roles updated successfully!'
    end
  end
end
