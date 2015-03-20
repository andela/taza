require 'rails_helper'

describe Ability, type: :model do
  attr_accessor :user, :ability
  # subject(:ability) { Ability.new(user) }
  # let(:user) { nil }


  context 'admin' do
    # let(:user) { create(:user) }

    before do
      @user = create(:user)
      user.add_role :admin
      @ability = Ability.new(user)
    end

    it 'should have an admin role' do
      expect(user).to have_role :admin
    end

    it 'can manage role' do
      expect(ability.can?(:manage, :all)).to be_truthy
    end

    it 'can manage role' do
      expect(ability.can?(:read, :all)).to be_truthy
    end
  end
end