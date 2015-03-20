require 'rails_helper'

RSpec.describe AdminInitializer do
  describe "Admin environment variable is set" do
    before :each do
      allow(ENV).to receive(:[]).with('TAZA_ADMIN_EMAIL').and_return("debbie@example.com")
    end

    it "should get the default env admin email" do
      expect(ENV['TAZA_ADMIN_EMAIL']).to eq("debbie@example.com")
    end

    it "should not be an admin before admin is set" do
      user = users(:debbie)
      expect(user.has_role? :admin).to be_falsey
    end

    it "should not grant admin to unspecified account" do
      user = users(:chad)
      admin_initializer = AdminInitializer.new
      admin_initializer.grant_admin_access
      user.reload
      expect(user.has_role? :admin).to be_falsey
    end

    it "should grant admin access" do
      user = users(:debbie)
      admin_initializer = AdminInitializer.new
      admin_initializer.grant_admin_access
      user.reload
      expect(user.has_role? :admin).to be_truthy
    end
  end

  describe "If Admin environment variable is not set" do
    before :each do
      allow(ENV).to receive(:[]).with('TAZA_ADMIN_EMAIL').and_return(nil)
    end

    it "does not set the default env admin email" do
      admin_initializer = AdminInitializer.new
      expect do
        admin_initializer.grant_admin_access
      end.
          to raise_error.with_message(
                 "Default admin user not set as environment variable, set TAZA_ADMIN_EMAIL as environment variable"
             )
    end
  end
end