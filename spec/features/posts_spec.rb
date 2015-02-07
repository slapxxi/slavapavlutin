require 'rails_helper'

# Blog provides various convenient features such as
# filtering by tag, date, author etc.
RSpec.feature "Posts", type: :feature do
  let(:markdown_content) do
<<-Markdown
# Hello World
This is a paragraph.
## This is a header
Markdown
  end

  scenario "viewing posts" do
    FactoryGirl.create :post, title: 'Hello!'
    visit posts_path

    expect(page).to have_content 'Hello!'
  end

  scenario "viewing recent posts" do
  end

  # In order to create posts, I create an extended markdown
  # document in posts and use a rake task to convert them
  # into database entries.
  scenario "creating a post" do
    visit new_post_path

    fill_in 'post[title]', with: 'Introduction to Rails'
    fill_in 'post[author]', with: 'Slava Pavlutin'
    fill_in 'post[content]', with: 'Content'
    click_button 'Create Post'

    expect(page.current_path).to eq '/posts/introduction-to-rails'
    expect(page).to have_content 'Slava Pavlutin'
    expect(page).to have_content 'Content'
  end

  scenario "creating a post with Markdown content" do
    post = FactoryGirl.create :post, content: markdown_content
    visit post_path(post)

    content = page.find('.post .content')
    expect(content.find('h1')).to have_content 'Hello World'
    expect(content.find('p')).to have_content 'This is a paragraph.'
    expect(content.find('h2')).to have_content 'This is a header'
  end

  scenario "deleting a post"
  scenario "updating a post"
end
