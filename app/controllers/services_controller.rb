class ServicesController < ApplicationController
  before_filter :load_group, :only => %w(new show create)
  skip_before_filter :authenticate_user!, :only => %w(index)
  def index
    @services = Service.all
  end

  def new
    @service = @group.services.build
  end

  def show
    @service = @group.services.find(params[:id])
  end

  def create
    @service = @group.services.build(params[:service])

    if @service.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_service(@group)
    end
  end

private
  def load_group
    @group = Group.find(params[:group_id])
  end
end
