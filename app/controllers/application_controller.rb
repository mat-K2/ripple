class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  prepend_before_filter :set_locale

  def set_locale
    I18n.locale = params[:lang] || get_locale_from_current_user || get_locale_from_header || I18n.default_locale
    if current_user && current_user.locale.blank?
      current_user.update_attributes({ :locale => I18n.locale.to_s })
    end
  end

  private
  def get_locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def get_locale_from_current_user
    locale = current_user.try(:locale)
    locale if locale && available_locales.include?(locale.to_sym)
  end

  def self.available_locales
    I18n.available_locales
  end

  def available_locales
    @i18n_available_locales ||= self.class.available_locales
  end
end
