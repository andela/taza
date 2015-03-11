require 'rails_helper'

RSpec.describe AdminInitializer do
  before :each do
    allow(ENV).to receive(:[]).with('TAZA_ADMIN_EMAIL').and_return("debbie@example.com")
  end

  it "should get the default env admin email" do
    expect(ENV['TAZA_ADMIN_EMAIL']).to eq("debbie@example.com")
  end

  it "should not be an admin before admin is set" do
    user = users(:debbie)
    expect(user.admin?).to be_falsey
  end

  it "should not grant admin to unspecified account" do
    user = users(:chad)
    admin_initializer = AdminInitializer.new
    admin_initializer.grant_admin_access
    user.reload
    expect(user.admin?).to be_falsey
  end

  it "should grant admin access" do
    user = users(:debbie)
    admin_initializer = AdminInitializer.new
    admin_initializer.grant_admin_access
    user.reload
    expect(user.admin?).to be_truthy
  end

end
