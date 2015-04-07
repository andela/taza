class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable, :omniauthable,
         omniauth_providers: [:google_oauth2]
  validates :email, presence: true, uniqueness: true
  # validates :role, inclusion: {in: Roles}
  after_create :add_member_role
  scope :unique_roles, ->(users_ids) { where(id: users_ids).where.not(roles: {name: 'fellow'}).joins(:roles).uniq.order('roles.name').pluck('roles.name') }

  def self.find_for_google_oauth2(google_response)
    return nil unless google_response_valid?(google_response)
    data = google_response.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create!(email: data['email'], name: data['name'], image: data['image'] )
    end
    user
  end

  def self.google_response_valid?(response)
    response.try(:info).present?
  end

  def add_member_role
    self.add_role :fellow
  end

  def admin?
    role == 'admin'
  end

  def grant_admin_role
    unless admin?
      update_attributes!(:role => 'admin')
    end
  end

  def self.update_roles(users_id, role_names, admin)
    users = find(users_id[0].split(' '))
    users.each do |user|
      user.update_roles(role_names, admin)
    end
  end

  def update_roles(role_names, admin)
    role_names ||= []
    Role::ROLE_NAMES.each do |role|
      if role_names.include?(role)
        self.add_role(role) unless self.has_role?(role)
      else
        self.remove_role(role) unless self == admin && role == 'admin'
      end
    end
  end

  def assigned_roles
  end
end