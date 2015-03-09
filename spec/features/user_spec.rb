require 'rails_helper'

feature 'User exists' do
  scenario 'User visits homepage and signs in/signs out' do
    OmniAuth.config.test_mode = true
    set_valid_omniauth

    visit '/'
    click_link 'Sign in with Google'
    expect(page).to have_link('Sign Out')
    click_link 'Sign Out'
    expect(page).to have_link('Sign in with Google')
  end
end