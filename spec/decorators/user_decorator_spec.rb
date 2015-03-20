require 'rails_helper'

describe UserDecorator do
  describe 'assigned_roles' do
    let!(:user) { create(:user).decorate }

    before do
      user.add_role :admin
      user.add_role :fellow
      user.add_role :mentor
    end

    it 'sorts the roles in alphabetical order' do
      expect(user.assigned_roles).to eq('Admin, Fellow, Mentor')
    end
  end
end