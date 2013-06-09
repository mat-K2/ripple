class Make::ServicesController < ApplicationController
  def index
    @services = current_user.services
  end

  def new
    @service = Service.new
  end

  def edit
    @service = current_user.services.find(params[:id])
  end

  def show
    @service = current_user.services.find(params[:id])
    @entries = @service.entries.order("created_at DESC")
  end

  def create
    @service = Service.new(params[:service])
    @service.make_users.build(:user_id => current_user.id)
    if params[:oauth]
      @service.key = [*0..9, *'a'..'z', *'A'..'Z'].sample(20).join
      @service.secret = [*0..9, *'a'..'z', *'A'..'Z'].sample(40).join
    end

    if @service.save
      redirect_to make_service_path(@service)
    else
      render "new"
    end
  end

  def update
    @service = current_user.services.find(params[:id])
    if params[:oauth]
      @service.key = [*0..9, *'a'..'z', *'A'..'Z'].sample(20).join
      @service.secret = [*0..9, *'a'..'z', *'A'..'Z'].sample(40).join
    end

    if @service.update_attributes(params[:service])
      redirect_to make_service_path(@service)
    else
      render "edit"
    end
  end
end
