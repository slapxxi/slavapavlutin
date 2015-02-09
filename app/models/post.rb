class Post < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :slug, presence: true

  def excerpt
    content.split("\n").first
  end

  def related
    self.class.all
  end
end
