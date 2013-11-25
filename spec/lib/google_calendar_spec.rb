require 'spec_helper.rb'

describe GoogleCalendar, :vcr do
  describe "#get_events" do
    it "loads the events from a URL" do
      url = "http://www.google.com/calendar/feeds/pivotallabs.com_n5a473ppkd06bgio9h4fudojf4%40group.calendar.google.com/public/basic"
      expect(GoogleCalendar.fetch_events(url).size).to eq(5)
    end
  end
end
