require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  describe "GET #index" do
    let!(:users) { create_list(:user, 4) }
    let!(:user) { User.first }
    before do
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
      user.add_role :admin
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
      expect(user).to have_role(:admin)
    end

    describe "admin" do
      it "can delete a user" do
        @user = users[1]
        expect do
          delete :destroy, id: @user
        end.
            to change(User, :count).by(-1)
      end

      it "redirects to admin page after deleting a user" do
        @user = users[1]
        delete :destroy, id: @user
        expect(response).to redirect_to admin_users_path
      end

      it "cannot delete itself" do
        expect do
          delete :destroy, id: user
        end.
            to_not change(User, :count)
        expect(response).to redirect_to(admin_users_path)
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe " if user is not an admin " do
    before do
      user = users(:chad)
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      user.add_role :fellow
      allow(controller).to receive(:current_user).and_return(user)
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
