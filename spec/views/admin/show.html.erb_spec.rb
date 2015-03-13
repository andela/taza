require 'rails_helper'

RSpec.describe "admin/show.html.erb", type: :view do
  it "should show admin" do
    render
    expect(rendered).to have_content('Admin#show')
  end
end
