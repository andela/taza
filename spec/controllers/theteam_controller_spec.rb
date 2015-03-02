require 'rails_helper'

RSpec.describe TheteamController do

  describe "#show" do
    it "placeholder" do
      expect(true).to eq(true)
    end
  end

  it 'renders the :theteam view' do
    get :show
    expect(response).to render_template :show
  end
end
