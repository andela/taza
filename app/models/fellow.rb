class Fellow < ActiveRecord::Base
  rolify
  belongs_to :user
end
