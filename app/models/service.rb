class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category
  has_many :make_users
  has_many :users, :through => :make_users
  has_many :entries

  CATEGORY_LIST = %w(education life).freeze

  scope :category_services, lambda{ |category|
    where(:category => category)
  }
end
