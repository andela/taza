require 'rails_helper'

describe "login with google id should redirect to home page" do
  it "should login with google" do
    visit "/login"
    find_by_id("login").click()

    fill_in 'Email', :with => 'aaaa@gmail.com'      # Use your test login id
    fill_in 'Passwd', :with => 'xxxxxxxx'                  # Use your test login password
    click_button 'signIn'

    click_button 'approve_button'

    page.has_content?('AAAA')                          # Use your assert here
  end
end