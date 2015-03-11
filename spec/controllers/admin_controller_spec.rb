require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders admin page" do
      get :show
      expect(response).to render_template :show
    end
  end
end
