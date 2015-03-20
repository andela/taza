require 'rails_helper'

describe RolesHelper do
  describe 'checked roles' do

    before do
      assign(:role_names, ['admin', 'fellow'])
    end

    context 'role is checked' do
      let!(:role) { 'fellow' }

      it "is expected to be truthy" do
        expect(helper.role_checked?(role)).to be_truthy
      end
    end

    context 'role is not checked' do
      let!(:role) { 'mentor' }
      it "is expected to be falsey" do
        expect(helper.role_checked?(role)).to be_falsey
      end
    end
  end
end