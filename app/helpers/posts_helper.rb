module PostsHelper
  def from_markdown(content)
    raw ::Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, {}).render(content)
  end
end
