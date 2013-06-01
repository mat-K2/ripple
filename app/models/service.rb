class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category, :key, :secret, :oauth_flg
  has_many :make_users
  has_many :users, :through => :make_users
  has_many :entries

  validates_uniqueness_of :key, :scope => [:secret], :allow_nil => true

  CATEGORY_LIST = %w(education life).freeze

  scope :category_services, lambda{ |category|
    where(:category => category)
  }
end
