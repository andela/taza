require 'rails_helper'

describe HomesController do

  it 'renders the :homes view' do
    get :show
    expect(response).to render_template :show
  end
end