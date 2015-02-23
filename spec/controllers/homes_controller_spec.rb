require 'rails_helper'

describe HomesController do
  describe "#show" do
    it "placeholder" do
      expect(true).to eq(true)
    end
  end

  it 'renders the :homes view' do
    get :show
    expect(response).to render_template :show
  end
end