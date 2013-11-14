require 'spec_helper'


describe LocalStations, :vcr => trur do
  describe ".find" do
    let(:address) { "625 6th Avenue, New York, NY"}
    let(:lat_lon) { Geocoder.coordinates(address) }
    let(:radius) { 0.5 }
    let(:returned_stations) { LocalStations.find(lat_lon, radius) }

    it "returns the n closest stations" do
      returned_stations.map! { |station| station[:id] }
      returned_stations.should include 168
      returned_stations.should_not include 540
    end
  end
end


