require 'open-uri'

class GoogleCalendar
  def self.fetch_events(url)
    response = Net::HTTP.get_response(URI(url))

    [1,2,3,4,5]
  end
end
