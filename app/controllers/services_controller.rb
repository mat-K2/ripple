require 'service_app_client'

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

    if @iframe_url = params[:url]
      ServiceAppClient.new(@iframe_url).login(current_user.email, current_user.encrypted_password)
    end
  end
end
