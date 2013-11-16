require 'spec_helper'

feature 'my feature' do
  it "loads a page" do
    When "I visit the home page"
    Then "I see the right page title"
  end

  def i_visit_the_home_page
    visit "/nyc"
  end

  def i_see_the_right_page_title
    expect(page.title).to eq 'NYC Dashboard'
  end
end
