class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @hot_services = [Service.first, Service.last]
    @life = Service.life_services
    @education = Service.educational_services
  end

  def show
    @service = Service.find(params[:id])
    @make_users = @service.users
    @entry = current_user.entries.build
    @entries = @service.entries
    @favorite = current_user.favorites.find_by_service_id(params[:id]) || current_user.favorites.build
    @iframe_url = params[:url] ? params[:url] + "/auth/ripple?uid=#{current_user.id}" : nil
  end
end
