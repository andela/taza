require 'rails_helper'

feature 'Admin' do

  before do
    page.driver.block_unknown_urls
    OmniAuth.config.test_mode = true
    set_valid_omniauth
    visit '/'
    click_on 'Sign in with Google'
    @user = User.last
    @user.add_role :admin
    visit current_path
    click_on 'Admin'
  end

  scenario 'visit admin page and updates users roles', js: true do
    expect(page).to have_content('herlbert@example.com')
    expect(page).to have_content('Mentor')


    find(:css, "#check-all").set(false)
    click_on 'Edit Roles'
    expect(page).to have_content('Please select a user or users')

    find(:css, "#check-all").set(true)
    click_on 'Edit Roles'
    expect(page).to_not have_content('Please select a user or users')
    click_on 'Close'

    find(:css, "#users_ids_[value='#{@user.id}']").set(true)
    click_on 'Edit Roles'
    expect(page).to have_content('Which roles do you want to add/remove?')
    find(:css, "#role_names_[value='mentor']").set(true)
    click_on 'Save'
    expect(page).to have_content('Mentor')
  end

  scenario 'Admin cannot remove own role', js: true do
    find(:css, "#users_ids_[value='#{@user.id}']").set(true)
    click_on 'Edit Roles'
    find(:css, "#role_names_[value='admin']").set(false)
    click_on 'Save'
    expect(page).to have_content('Admin')
  end
end