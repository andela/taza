require 'rails_helper'

describe "login with google id should redirect to home page", :js => true do
  it "should login with google" do
    visit "/"
    click_on "Sign in with Google"

    fill_in 'Email', :with => 'tolulope.komolafe@andela.co'      # Use your test login id
    fill_in 'Passwd', :with => 'adohim_03'                  # Use your test login password
    click_button 'signIn'
    #click_button 'approve_button'
    #click_on 'Accept'


    expect(page).to have_content('Accept')                         # Use your assert here
  end
end