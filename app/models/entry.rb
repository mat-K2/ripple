class Entry < ActiveRecord::Base
  attr_accessible :content, :service_id
  belongs_to :user

  validates :content, :presence => true
end
