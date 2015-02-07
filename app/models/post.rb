class Post < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true
  validates :slug, presence: true
end
