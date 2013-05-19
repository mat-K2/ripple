class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @hot_services = [Service.all[0], Service.all[1]]
    @life = Service.life_services
    @education = Service.educational_services
    @game = Service.game_services
    @entry = Entry.order("created_at DESC")
  end

  def show
    @service = Service.find(params[:id])
    @make_users = @service.users
    @entry = current_user.entries.build
    @entries = @service.entries.order("created_at DESC")
    @iframe_url = params[:url] ? params[:url] + "/auth/rippler?uid=#{current_user.id}" : nil
  end
end
