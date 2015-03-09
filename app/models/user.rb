class User < ActiveRecord::Base
  VALID_ROLES ||= %w[none fellow admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable, :omniauthable,
         omniauth_providers: [:google_oauth2]
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: VALID_ROLES }

  def self.find_for_google_oauth2(google_response)
    return nil unless google_response_valid?(google_response)
    data = google_response.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create!(email: data['email'])
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
      update_attribute(:role, 'admin')
    end
  end
end
