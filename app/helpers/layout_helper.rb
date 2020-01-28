module LayoutHelper

  def site_name
    "App Name".freeze
  end

  def page_title
    @page_title.present? ? [@page_title, site_name].compact.join(" - ") : site_name
  end

  def page_description
    @page_description if @page_description.present?
  end

end
