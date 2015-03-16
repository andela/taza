class AdminController < ApplicationController
  def show
    @users = User.all
  end
end
