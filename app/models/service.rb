class Service < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :introduction, :category
end
