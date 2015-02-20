require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do
  before do
    OmniAuth.config.test_mode = true
    request.env['devise.mapping'] = Devise.mappings[:user]
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_auth2]
  end

  describe '#google_oauth2' do
    attr_accessor :existing_user

    before do
      @existing_user = User.create!(email: "something@example.com")
      allow(User).to receive(:find_for_google_oauth2) { existing_user }
    end

    it 'assign @user' do
      get :google_oauth2
      expect(assigns(:user)).to eq(existing_user)
    end

    context 'valid credentials' do
      before do
        set_valid_omniauth
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        get :google_oauth2
      end

      it 'signs in user' do
        expect(controller).to be_user_signed_in
      end

      it 'displays success message' do
        expect(flash[:notice]).to eq("User successfully authenticated from Google account")
      end
    end

    it 'redirects to root path' do
      get :google_oauth2
      expect(response).to redirect_to root_path
    end

    context 'invalid credentials' do
      before do
        @existing_user = nil
        set_invalid_omniauth
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

        get :google_oauth2
      end

      it 'displays error message' do
        expected_message = "Could not authenticate user from Google account"
        expect(flash[:notice]).to eq(expected_message)
      end
    end
  end
end