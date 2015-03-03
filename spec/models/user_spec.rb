require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_for_google_oauth2' do
    context 'user exist' do
      it 'return existing user' do
        existing_user = create(:user)
        google_oauth2_response = build_google_oauth2_response(existing_user.email)
        user = User.find_for_google_oauth2(google_oauth2_response)
        expect(user).to eq(existing_user)
      end
    end

    context 'user does not exist' do
      it 'create user' do
        google_oauth2_response = build_google_oauth2_response
        user = User.find_for_google_oauth2(google_oauth2_response)
        expect(user).not_to be_nil
      end
    end

    context 'bad response from google' do
      it 'returns nil' do
        bad_response = :invalid_credentials
        result = User.find_for_google_oauth2(bad_response)
        expect(result).to be_nil
      end
    end
  end

  describe '.google_response_valid?' do
    context 'invalid response from google' do
      it 'returns false' do
        bad_response = :invalid_credentials
        result = User.google_response_valid?(bad_response)
        expect(result).to be_falsey
      end
    end

    context 'valid response from google' do
      it 'returns true' do
        google_response = build_google_oauth2_response
        result = User.google_response_valid?(google_response)
        expect(result).to be_truthy
      end
    end
  end

  describe "validation" do
    it "is valid with an email" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email address" do
      user = build(:user, email: nil)
      expect(user).to have(1).errors_on(:email)
    end

    it "is invalid with a duplicate email address" do
      create(:user, email: "something@example.com")
      user = build(:user, email: "something@example.com")
      expect(user).to have(1).errors_on(:email)
    end
  end
end
