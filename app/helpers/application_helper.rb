module ApplicationHelper

  def view_select_language
    t('views.commons.language') + ': ' +  t("views.commons.#{I18n.locale || I18n.default_locale}")
  end

  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
