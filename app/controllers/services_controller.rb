class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @hot_services = [Service.first, Service.last]
    @business = Service.business_services
    @education = Service.educational_services
    @music = Service.music_services
  end

  def show
    @service = @group.services.find(params[:id])
  end
end
