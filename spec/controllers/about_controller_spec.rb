require 'rails_helper'

RSpec.describe AboutController do

  it 'renders the :about view' do
    get :show
    expect(response).to render_template :show
  end
end
