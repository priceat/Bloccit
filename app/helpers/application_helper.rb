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

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def up_vote_class(post)
    vote = current_user.voted(post)
    'glyphicon glyphicon-chevron-up' unless vote && vote.up_vote?
  end
  
  def down_vote_class(post)
    vote = current_user.voted(post)
    'glyphicon glyphicon-chevron-down' if vote && vote.up_vote?
  end

end
