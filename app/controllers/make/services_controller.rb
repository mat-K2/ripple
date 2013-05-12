class Make::ServicesController < ApplicationController
  def index
    @services = current_user.services
  end

  def new
    @service = Service.new
  end

  def show
    @service = current_user.services.find(params[:id])
  end

  def create
    @service = Service.new(params[:service])
    @service.make_users.build(:user_id => current_user.id)
    @service.key = [*0..9, *'a'..'z', *'A'..'Z'].sample(20).join
    @service.secret = [*0..9, *'a'..'z', *'A'..'Z'].sample(40).join

    if @service.save
      redirect_to make_service_path(@service)
    else
      render "new"
    end
  end
end
