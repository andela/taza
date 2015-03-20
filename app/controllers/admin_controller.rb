class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.order(name: :asc).decorate
  end
end
