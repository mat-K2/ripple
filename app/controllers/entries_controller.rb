# -*- coding: utf-8 -*-
class EntriesController < ApplicationController
  layout false, :only => %w[new create]

  skip_before_filter :authenticate_user!
  before_filter :entry_authenticate_user!

  def index
    @entries = current_user.entries.order("created_at DESC")
  end

  def new
    @entry = current_user.entries.build
    @service_url = params[:url]
  end

  def create
    @entry = current_user.entries.build(params[:entry])
    @entry.service = Service.find_by_url(fix_url(params[:url]))
    if @entry.save
      redirect_to new_entry_path, :notice => "フィードバックを送りました。"
    else
      render "new"
    end
  end

  private
  def entry_authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end

  def fix_url(params_url)
    params_url.match(/^([a-z]+):\/\/([a-zA-Z0-9:.-]+)\//)[0]
  end
end
