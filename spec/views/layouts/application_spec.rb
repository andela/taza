require 'rails_helper'

describe "layouts/application.html.erb" do
    it 'shows all links' do
      render

      expect(rendered).to have_link("Taza")
      expect(rendered).to have_link("About")
      expect(rendered).to have_link("Our Fellows")
      expect(rendered).to have_link("Your Role")
      expect(rendered).to have_link("How it Works")
      expect(rendered).to have_link("Sign in with Google")

    end

    describe "User Sign in" do
      before do
        allow(view).to receive(:user_signed_in?).and_return(false)
      end
      it "shows the signin link" do
        render
        expect(rendered).to have_link("Sign in with Google")
      end
    end

    describe "User Sign Out" do
      before do
        allow(view).to receive(:user_signed_in?).and_return(true)
        allow(view).to receive(:current_user).and_return(build(:user))
      end
      it "shows the signout link" do
        render
        expect(rendered).to have_link("Sign Out")
      end
    end
    describe "Admin Sign in" do
      before do
        user = users(:debbie)
        user.grant_admin_role
        allow(view).to receive(:user_signed_in?).and_return(true)
        allow(view).to receive(:current_user).and_return(user)
      end
      it "shows the admin link" do
        render
        expect(rendered).to have_link("Admin")
      end
    end

    describe "User profile" do
      before do
        user = users(:debbie)
        allow(view).to receive(:user_signed_in?).and_return(true)
        allow(view).to receive(:current_user).and_return(user)
      end

      it "should show the user profile" do
        render
        expect(rendered).to have_content('deborah enomah')
        expect(rendered).to have_selector( 'img[src="https://image.jpg" ]' )
      end
    end
end
