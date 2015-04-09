require 'rails_helper'

RSpec.describe FellowsController, type: :controller do
  it 'renders the fellow profile view' do
    get :index
    expect(response).to render_template :index
  end
end
