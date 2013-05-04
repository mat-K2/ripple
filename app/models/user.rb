class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  has_many :make_users
  has_many :services, :through => :make_users
  has_many :entries
  has_many :favorites
  has_many :favorite_services, :through => :favorites, :source => :service

  def make_user?
    MakeUser.where(:user_id => self.id).present?
  end

  def favorite?(service)
    self.favorite_services.include?(service)
  end
end
