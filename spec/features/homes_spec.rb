require 'rails_helper'

describe "#home page" do
  it "shows all links" do
    visit '/'

    expect(page).to have_link "Who we are"
    expect(page).to have_link "Our Fellows"
    expect(page).to have_link "Your Role"
    expect(page).to have_link "How it Works"
    expect(page).to have_content "Sign In"
  end
end