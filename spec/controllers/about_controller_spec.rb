require 'rails_helper'

RSpec.describe AboutController do
  describe "#show" do
    it "placeholder" do
      expect(true).to eq(true)
    end
  end

  it 'renders the :show template' do
    get :show
    expect(response).to render_template :show
  end
end
