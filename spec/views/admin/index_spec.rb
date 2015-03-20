require 'rails_helper'

describe "admin/index.html.erb" do
  before do
    user = users(:debbie)
    user.add_role :admin
    allow(view).to receive(:user_signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(user)
    @users = [build(:user)]
  end

  it 'show a list of all users' do
    render

    expect(rendered).to have_content(@users.first.name)
    expect(rendered).to have_content(@users.first.email)
  end
end