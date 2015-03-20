require 'rails_helper'

describe RoleDecorator do
  describe 'capitalized_name' do
    let(:role) { create(:role).decorate }
    it 'capitalizes roles name' do
      expect(role.capitalized_name).to eq('Fellow')
    end
  end
end