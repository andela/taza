require 'rails_helper'

describe "fellows/index.html.erb" do
  attr_accessor :user
  before do
    @user = users(:debbie)
    user.add_role :fellow
    allow(view).to receive(:user_signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'shows the fellow profile' do
    render

    expect(rendered).to have_content(user.name)
    expect(rendered).to have_content(user.email)
  end
end