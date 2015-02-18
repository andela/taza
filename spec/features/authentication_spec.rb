require 'rails_helper'

describe "login with google id should redirect to home page", :js => true do
  it "should login with google" do
    visit "/"
    click_on "Sign In"

    fill_in 'Email', :with => '1testertest1@gmail.com'      # Use your test login id
    fill_in 'Passwd', :with => 'p87654321'                  # Use your test login password
    click_button 'signIn'


    expect(page).to have_content('Accept')                         # Use your assert here
  end
end