class Post < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :slug, presence: true

  before_create do
    self.content = from_markdown_to_html content
  end

  private
  def from_markdown_to_html(markdown)
    ::Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, {}).render(content)
  end
end
