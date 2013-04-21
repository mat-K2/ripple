class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category
  has_many :make_users
  has_many :users, :through => :make_users

  CATEGORY_LIST = %w(business education music).freeze

  scope :business_services, lambda{
    where(:category => "business")
  }

  scope :educational_services, lambda{
    where(:category => "education")
  }

  scope :music_services, lambda{
    where(:category => "music")
  }
end
