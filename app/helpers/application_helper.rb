module ApplicationHelper
  def my_name
    "Tate Price aka Voltron"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form_group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
