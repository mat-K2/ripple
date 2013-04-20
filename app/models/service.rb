class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category
  has_many :make_users
end
