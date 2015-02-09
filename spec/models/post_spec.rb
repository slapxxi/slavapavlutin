require 'rails_helper'

RSpec.describe Post, type: :model do
  specify "excerpt is a first paragraph in a post" do
    content = <<-CONTENT
    First paragraph.
    Second paragraph.
    CONTENT
    post = FactoryGirl.create :post, content: content.strip

    expect(post.excerpt).to eq 'First paragraph.'
  end
end
