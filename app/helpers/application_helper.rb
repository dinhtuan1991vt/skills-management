module ApplicationHelper
  include ActionView::Helpers::TagHelper

  def render_menu_item(path, text)
    class_name = current_page?(path) ? 'active' : ''
    content_tag(:li, class: class_name) do
      link_to text, path
    end
  end
end
