class ApiController < ApplicationController
  skip_before_filter :authenticate_user!, :set_locale
  def oauth
    if @service = Service.find_by_key_and_secret(params[:consumer_key], params[:consumer_secret])
      render json: {"provider" => "rippler"}
    else
      render json: {"error" => "consumer key or secret is different"}
    end
  end
end
