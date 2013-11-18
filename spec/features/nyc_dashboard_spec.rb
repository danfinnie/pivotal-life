require 'spec_helper'

feature "NYC Dashboard" do
  scenario "User sees link to GitHub page" do
    visit "/nyc"
    expect(page).to have_content 'github.com/spilth/pivotal-life'
  end
end

