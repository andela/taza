class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.role.nil?
      render 'finish'
    else
      redirect_to edit_users_path
    end
  end
  def finish
    @user = current_user
    if @user.role.nil?
      render 'finish'
    else
      redirect_to edit_users_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
