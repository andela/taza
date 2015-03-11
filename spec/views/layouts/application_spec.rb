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
end