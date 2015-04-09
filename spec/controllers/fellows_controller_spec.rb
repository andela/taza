require 'rails_helper'

RSpec.describe FellowsController, type: :controller do
<<<<<<< HEAD
  before do
    user = users(:chad)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    user.add_role :fellow
    allow(controller).to receive(:current_user).and_return(user)
    get :index
  end

=======
>>>>>>> [#87892960] Added controller and model for a fellow with corresponding test
  it 'renders the fellow profile view' do
    get :index
    expect(response).to render_template :index
  end
end
