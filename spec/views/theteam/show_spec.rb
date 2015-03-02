require 'rails_helper'

describe "theteam/show.html.erb" do
  it 'shows all links' do
    render

    expect(rendered).to have_link("ABOUT US")
    expect(rendered).to have_link("MEET THE TEAM")
  end
end