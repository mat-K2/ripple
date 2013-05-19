class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @hot_services = [Service.all[0], Service.all[1]]
    @all_entries = Entry.order("created_at DESC")
    @category_services = Service.category_services(params[:category]).each_slice(4).to_a if params[:category]
  end

  def show
    @service = Service.find(params[:id])
    @make_users = @service.users
    @entry = current_user.entries.build
    @entries = @service.entries.order("created_at DESC")
    @iframe_url = params[:url] ? params[:url] + "/auth/rippler?uid=#{current_user.id}" : nil
  end
end
