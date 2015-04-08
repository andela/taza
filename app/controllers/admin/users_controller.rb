class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.order(name: :asc).decorate
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy unless @user.has_role? :admin
      flash[:notice] = "User deleted successfully"
    end
    redirect_to admin_users_path
  end
end