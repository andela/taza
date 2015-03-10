require 'rails_helper'

describe "team_members/index.html.erb" do
  it "renders the index page" do
     assign(:team_members, [build(:team_member)])
      render
      expect(rendered).to have_link("ABOUT US")
      expect(rendered).to have_link("MEET THE TEAM")
    end
end