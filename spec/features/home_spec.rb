require 'rails_helper'

# Home page allows to navigate a user around a site
# and suggests a further place to visit.
RSpec.feature "Home", type: :feature do
  scenario "visit a home page" do
    visit root_path
    expect(page.current_path).to eq '/'
  end

  scenario "return to a home page" do
    visit posts_path
    click_link 'Home'
    expect(page.current_url).to eq root_url
  end
end
