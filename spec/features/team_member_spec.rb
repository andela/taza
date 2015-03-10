require 'rails_helper'

feature 'Employees Profiles' do
  before do
    visit team_members_path
  end

  scenario 'User visits meet the team page' do
    expect(page).to have_link('ABOUT US')
    expect(page).to have_link('MEET THE TEAM')
  end

  scenario 'Show employee details on click', js: true do
    jeremy_id = team_members(:jeremy).id
    jeremy_bio_css_id = "#bioteam_member_#{jeremy_id}"
    jeremy_photo_css_id = "#team_member_#{jeremy_id}"
    expect(page).to_not have_selector(jeremy_bio_css_id)
    find(jeremy_photo_css_id).click
    expect(page).to have_selector(jeremy_bio_css_id)

    obie_id = team_members(:obie).id
    obie_bio_css_id = "#bioteam_member_#{obie_id}"
    obie_photo_css_id = "#team_member_#{obie_id}"
    expect(page).to_not have_selector(obie_bio_css_id)
    find(obie_photo_css_id).click
    expect(page).to_not have_selector(jeremy_bio_css_id)
    expect(page).to have_selector(obie_bio_css_id)
  end
end
