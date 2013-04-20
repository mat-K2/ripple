class Make::ServicesController < ApplicationController
  def index
    @services = current_user.services
  end

  def show
    @service = current_user.services.find(params[:id])
  end
end
