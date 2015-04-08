require 'rails_helper'

describe RolesController, type: :controller    do
  describe 'edit_multiple roles' do
    attr_accessor :user
    before do
      user = users(:debbie)
      allow(request.env['warden']).to receive(:authenticate!) { user }
      user.add_role :admin
      allow(controller).to receive(:current_user) { user }
    end

    it 'assigns a list of checked users' do
      xhr :get, :edit_multiple, users_ids: [1,2]
      expect(assigns(:users_ids)).to eq(['1', '2'])
    end

    it 'assigns roles for checked users' do
      users = create_list(:user, 3)
      users.first.add_role :admin
      users.second.add_role :mentor
      users.third.add_role :admin

      xhr :get, :edit_multiple, users_ids: users.map(&:id)
      expect(assigns(:role_names)).to eq(['admin', 'mentor'])
    end

    it 'assigns a list of all roles' do
      xhr :get, :edit_multiple, users_ids: [1,3]
      expect(assigns(:roles)).to eq(['admin', 'fellow', 'mentor'])
    end

    it 'retrieves role names from update modal window' do
      users = create_list(:user, 2)
      users.first.add_role :admin
      users.first.add_role :mentor
      users.second.add_role :mentor

      expect(User).to receive(:update_roles)
      xhr :put, :update_multiple, users_ids: users.map(&:id).join(','), role_names: ['admin']
      expect(response).to redirect_to admin_users_path
    end

    it 'expects no users ids if no checked box' do
      xhr :get, :edit_multiple, users_ids: []
      expect(assigns(:users_ids)).to eq([])
    end
  end
end