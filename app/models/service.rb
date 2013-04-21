class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category
  has_many :make_users
  has_many :users, :through => :make_users
  has_many :entries

  CATEGORY_LIST = %w(education life).freeze

  scope :educational_services, lambda{
    where(:category => "education")
  }

  scope :life_services, lambda{
    where(:category => "life")
  }
end
