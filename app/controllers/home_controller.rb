class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  layout false
  def index
    @hot_services = Service.all.slice(0..7)
  end
end
