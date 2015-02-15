class User < ActiveRecord::Base
  has_one :fellow
  has_one :mentor
  validate :cannot_have_fellow_and_mentor
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.save
    end
  end
  def cannot_have_fellow_and_mentor
    if self.mentor.present? and self.fellow.present?
      errors.add( :user, "can't be a fellow and a mentor")
    end
  end
end
