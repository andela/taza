require 'rails_helper'

describe "the_teams/index.html.erb" do
  it "renders the index page" do
     assign(:the_teams, [build(:the_team)])
      render
      expect(rendered).to have_link("ABOUT US")
      expect(rendered).to have_link("MEET THE TEAM")
    end
end