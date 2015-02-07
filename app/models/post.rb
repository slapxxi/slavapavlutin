class Post < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :slug, presence: true

  def preview
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis obcaecati mollitia dolorem voluptate nihil dolorum dignissimos laboriosam vitae vero provident unde fuga quasi pariatur molestias beatae, earum expedita voluptatem soluta."
  end
end
