require 'rails_helper'

describe "admin/show.html.erb" do
  before do
    @users = [build(:user)]
  end
  it 'show a list of all users' do
    render

    expect(rendered).to have_content(@users.first.name)
    expect(rendered).to have_content(@users.first.email)
  end
end
