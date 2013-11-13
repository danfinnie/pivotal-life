require 'nokogiri'
require 'open-uri'

class MovemberFetcher
  def initialize(team_number)
    @team_number = team_number
  end

  def fetch
    {
      label: team_name,
      value: donations_raised
    }
  end

  private

  def team_name
    clean_selector_output('h1')
  end

  def donations_raised
    with_units = clean_selector_output('.overflow:contains("Total Raised") .info')
    with_units[/\s(.*)/, 1]
  end

  def clean_selector_output(selector)
    team_page.css(selector).first.content.strip
  end
    

  def team_page
    @team_page ||= Nokogiri::HTML(open(team_url))
  end

  def team_url
    "http://us.movember.com/team/#@team_number"
  end
end
