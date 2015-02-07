require 'rails_helper'

# Blog provides various convenient features such as
# filtering by tag, date, author etc.
RSpec.feature "Posts", type: :feature do
  scenario "viewing posts" do
    visit root_path
    click_link 'Posts'
    expect(page).to have_content 'Recent Posts'
  end

  # In order to create posts, I create an extended markdown
  # document in posts and use a rake task to convert them
  # into database entries.
  scenario "creating a post" do
    visit root_path
    click_link 'Posts'
    click_link 'New Post'

    fill_in 'post[title]', with: 'Introduction To Something'
    fill_in 'post[author]', with: 'Slava Pavlutin'
    fill_in 'post[content]', with: 'Content'
    click_button 'Create Post'

    expect(page.current_path).to eq '/posts/introduction-to-something'
    expect(page).to have_content 'Slava Pavlutin'
    expect(page).to have_content 'Content'
  end

  scenario "creating a post with Markdown content" do
    visit new_post_path
    fill_in 'post[title]', with: 'Introduction to Something'
    fill_in 'post[author]', with: 'Slava Pavlutin'
    fill_in 'post[content]', with: <<-MARKDOWN
# Hello World
This is a paragraph.
## This is a header
MARKDOWN
    click_button 'Create Post'

    content = page.find('.post .content')
    expect(content.find('h1')).to have_content 'Hello World'
    expect(content.find('p')).to have_content 'This is a paragraph.'
    expect(content.find('h2')).to have_content 'This is a header'
  end

  scenario "deleting a post"
  scenario "updating a post"
end
