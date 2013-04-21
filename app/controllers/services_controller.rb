class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @hot_services = [Service.first, Service.last]
    @business = Service.business_services
    @education = Service.educational_services
    @music = Service.music_services
  end

  def show
    @service = Service.find(params[:id])
    @make_users = @service.users
    @iframe_url = params[:url]
  end
end
