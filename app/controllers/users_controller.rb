class UsersController < ApplicationController
  def update
    byebug
    @user = current_user
    if @user.update_attributes!(user_params)
      redirect_to edit_users_path
      flash[:notice] = "You have successfully updated your profile"
    else
      render 'edit'
    end
  end
  def edit
    @user = current_user
  end
  private
  def user_params
    params.require(:user).permit(:role, :name)
  end
end