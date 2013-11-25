require 'nokogiri'
require 'open-uri'

class MovemberFetcher
  def initialize(team_number)
    @team_number = team_number
  end

  def fetch
    {
      cols: [ team_name, team_size, donations_raised ].map { |value| { value: value } }
    }
  end

  private

  attr_reader :page_source

  def team_name
    clean_selector_output('h1')
  end

  def team_size
    clean_selector_output('h3:contains("Team Summary")')[/\d+/, 0]
  end

  def donations_raised
    with_units = clean_selector_output('.overflow:contains("Total Raised") .info')
    with_units[/\s(.*)/, 1]
  end

  def clean_selector_output(selector)
    team_page.css(selector).first.content.strip
  end

  def team_page
    @team_page ||= Nokogiri::HTML(page_source)
  end

  def page_source
    open(team_url)
  end

  def team_url
    "http://us.movember.com/team/#@team_number"
  end
end
