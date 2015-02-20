class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

    if @user
      sign_in(:user, @user)
      flash[:notice] = "User successfully authenticated from Google account"
    else
      flash[:notice] = "Could not authenticate user from Google account"
    end

    redirect_to root_path
  end
end