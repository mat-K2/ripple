class ServicesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def show
    @service = @group.services.find(params[:id])
  end

  def create
    @service = Service.new(params[:service])
    @service.make_users.build(:user_id => current_user.id)

    if @service.save
      redirect_to make_service_path(@service)
    else
      render "new"
    end
  end
end
