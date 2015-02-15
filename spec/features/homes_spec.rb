require 'rails_helper'

describe "#home page" do
  it "shows all links" do
    visit '/'

    expect(page).to have_link 'About'
    expect(page).to have_link 'What we do'
    expect(page).to have_link 'Fellowship'
    expect(page).to have_content 'Sign In'
  end
end