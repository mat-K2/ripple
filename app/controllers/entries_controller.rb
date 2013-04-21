class EntriesController < ApplicationController
  def create
    @entry = current_user.entries.build(params[:entry])
    @entry.save
    redirect_to service_path(params[:entry][:service_id])
  end
end
