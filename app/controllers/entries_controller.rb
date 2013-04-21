class EntriesController < ApplicationController
  def create
    @entry = current_user.entries.build(params[:entry])
    @entry.save
    @entries = Service.find(params[:entry][:service_id]).entries
    respond_to do |format|
      format.js
    end
  end
end
