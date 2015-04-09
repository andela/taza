require 'rails_helper'

describe Ability, type: :model do
  attr_accessor :user, :ability, :debbie

  context 'admin' do

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

  context 'fellow' do
    before do
      @debbie = users(:debbie)
      debbie.add_role :fellow
      @ability = Ability.new(debbie)
    end

    it 'should have a fellow role' do
      expect(debbie).to have_role :fellow
    end
  end
end