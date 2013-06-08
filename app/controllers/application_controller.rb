class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  prepend_before_filter :set_locale

  def set_locale
    I18n.locale = params[:lang] || get_locale_from_header || I18n.default_locale
  end

  private
  def get_locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
