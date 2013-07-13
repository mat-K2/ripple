class Make::EntriesController < ApplicationController
  def update
    @entry = current_user.services.find(params[:service_id]).entries.find(params[:id])
    if @entry.update_attributes(params[:entry])
      redirect_to make_service_path(params[:service_id])
    end
  end
end
