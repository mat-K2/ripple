class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @hot_services = [Service.all[0], Service.all[1]]
    @all_entries = Entry.order("created_at DESC")
    @category_services = Service.category_services(params[:category]).each_slice(4).to_a if params[:category]
  end

  def show
    @service = Service.find(params[:id])
    @make_users = @service.users
    @entry = current_user ? current_user.entries.build : nil
    @entries = @service.entries.order("created_at DESC")
    url = if params[:url]
            if params[:rippler]
              params[:url] + "/auth/rippler?uid=#{current_user.id}"
            else
              params[:url]
            end
          end
    @iframe_url = url
  end
end
