class MakeUser < ActiveRecord::Base
  attr_accessible :user_id, :service_id

  belongs_to :service
  belongs_to :user
end
