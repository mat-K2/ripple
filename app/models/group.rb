class Group < ActiveRecord::Base
  attr_accessible :name, :account_limit

  has_many :services
end
