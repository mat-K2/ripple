class Entry < ActiveRecord::Base
  attr_accessible :content, :service_id, :approve_flg
  belongs_to :user
  belongs_to :service

  validates :content, :presence => true

  def user_name
    self.user.name
  end

  def service_name
    self.service.name
  end
end
