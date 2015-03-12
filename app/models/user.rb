class User < ActiveRecord::Base
  Roles ||= %w[none admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable, :omniauthable,
         omniauth_providers: [:google_oauth2]
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: {in: Roles}

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

  def admin?
    role == 'admin'
  end

  def grant_admin_role
    unless admin?
      update_attributes!(:role => 'admin')
    end
  end
end
