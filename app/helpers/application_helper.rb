module ApplicationHelper

  def view_select_language
    t("views.defaults.language") + ": " +  t("views.defaults.#{I18n.locale || I18n.default_locale}")
  end
end
