require 'rails_helper'

feature 'Fellow' do

  before do
    OmniAuth.config.test_mode = true
    set_valid_omniauth
    visit '/'
    click_on 'Sign in with Google'
    @user = User.last
    @user.add_role :fellow
    visit current_path
    click_on 'My Profile'
  end

  scenario "views profile" do
    expect(page).to have_content('herlbert@example.com')
    expect(page).to have_content('Herlbert Hubbard')
    expect(page).to have_content('Bio')
    expect(page).to have_selector("img[src = 'https://lh3.googleusercontent.com/url/photo.jpg']")
  end
end