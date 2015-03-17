require 'rails_helper'

RSpec.describe TheTeamsController do

  describe "#show" do
    it "placeholder" do
      expect(true).to eq(true)
    end
  end

  it 'renders the :the_teams view' do
    get :index
    expect(response).to render_template :index
  end
end
