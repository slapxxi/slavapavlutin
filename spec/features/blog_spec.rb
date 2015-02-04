require 'rails_helper'

# Blog is a place where I can share my writing with others.
# In addition, it provides various convenient features so users
# can navigate around easily.
RSpec.feature "Blog", type: :feature do
  scenario "visit a blog page" do
    visit root_path
    click_link 'Blog'
    expect(page).to have_content 'Recent Posts'
  end
end
