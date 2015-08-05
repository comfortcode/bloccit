module PostsHelper
  
  def markdown_title(post)
    render_as_markdown(post.title)
  end 

  def markdown_body(post)
    render_as_markdown(post.body)
  end 
  
  def render_as_markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end 
end
