require 'rails_helper'

describe "login with google id should redirect to home page" do
  before do
    #puts user_omniauth_authorize_path(:google_oauth2) #/users/auth/google_oauth2
    #Capybara.current_driver = :selenium #change drive according whit https://github.com/jnicklas/capybara#drivers
    #visit  users_omniauth_authorize_path(:google_oauth2)
  end
  it "should login with google" do
    visit "/"
    find_link("Sign in with Google").click()

    fill_in 'Email', :with => 'calendarizeapp@gmail.com'      # Use your test login id
    fill_in 'Passwd', :with => '1234567'                  # Use your test login password
    click_button 'signIn'

    #click_button 'approve_button'

    page.has_content?('AAAA')                          # Use your assert here
  end
end