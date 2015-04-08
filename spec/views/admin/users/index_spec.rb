require 'rails_helper'

describe "admin/users/index.html.erb" do
  attr_accessor :chad, :yetty

  before do
    user = users(:debbie)
    user.add_role :admin
    allow(view).to receive(:user_signed_in?).and_return(true)
    allow(view).to receive(:current_user).and_return(user)
    @chad = users(:chad)
    @yetty = users(:yetty)
    assign(:users, [chad, yetty])
  end

  it 'show a list of all users' do

    render

    expect(rendered).to have_content(chad.name)
    expect(rendered).to have_content(yetty.name)
    expect(rendered).to have_link('Delete')
  end
end