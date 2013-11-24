require 'spec_helper'

feature "NYC Dashboard" do
  specify "the things it does" do
    When "I visit the home page"
    Then "I see the right page title"
    And "I see the GitHub link"
  end

  def i_visit_the_home_page
    visit "/nyc"
  end

  def i_see_the_right_page_title
    expect(page.title).to eq 'NYC Dashboard'
  end

  def i_see_the_github_link
    expect(page).to have_content 'github.com/spilth/pivotal-life'
  end
end
