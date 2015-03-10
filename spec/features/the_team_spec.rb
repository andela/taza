require 'rails_helper'

feature 'Meet the team page' do
  before do
    visit 'the_teams#index'
  end
    scenario 'User visits meet the team page' do

      expect(page).to have_link('ABOUT US')
      expect(page).to have_link('MEET THE TEAM')
    end
  end

feature 'Employees Profiles' do
  before do
    visit the_teams_path
  end
  scenario 'Show employee details on click', js: true do
    first('.clickablephoto', visible: false).set(true)
    first('.clickablephoto').click
    expect(page).to have_css('#name')
  end
end
