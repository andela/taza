require 'rails_helper'
RSpec.describe TeamMembersController do
  before(:each) do
    get :index
  end

  it 'renders the :team_members view' do
    expect(response).to render_template :index
  end

  describe 'team members' do
    it "returns a team member" do
      team_member = team_members(:jeremy)
      expect(response.body).to include(team_member.name)
    end

    it "populates an array of all members" do
      jeremy = team_members(:jeremy)
      christina = team_members(:christina)
      obie = team_members(:obie)
      ian = team_members(:ian)
      expect(assigns(:team_members)).to match_array([jeremy, christina, obie, ian])
    end
  end
end
