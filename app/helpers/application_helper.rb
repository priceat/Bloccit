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
  
  def vote_link_classes(post)
    if current_user.voted(post) && current_user.voted(post).up_vote?
      vote.post = 'glyphicon glyphicon-chevron-up' && 'voted'

    elsif current_user.voted(post) && current_user.voted(post).down_vote?
      vote.post = 'glyphicon glyphicon-chevron-down' && 'voted'

    else
    end
        


end
