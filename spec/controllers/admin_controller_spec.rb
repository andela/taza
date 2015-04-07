require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #index" do
    let!(:users) { create_list(:user, 4) }
    let!(:user) { User.first }
    before do
      allow(request.env['warden']).to receive(:authenticate!) { user }
      allow(controller).to receive(:current_user) { user }
    end

    it "returns http success" do

      user.add_role :admin
      get :index
      expect(response).to have_http_status(:success)
      expect(user).to have_role(:admin)
    end

    context " if user is not an admin " do
      before do
        user.add_role :fellow
        get :index
      end

      it "does not render the admin page" do
        expect(response).to_not render_template :index
      end

      it "redirects to the homepage" do
        expect(response).to redirect_to root_path
        expect(response.status).to eq 302
      end
    end
  end
end
