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
  end
end
