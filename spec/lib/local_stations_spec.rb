require 'spec_helper'

describe LocalStations, :vcr => true do
  describe ".find" do
    let(:lat_lon) { [40.74033720000001, -73.9951462] }
    let(:radius) { 0.5 }
    let(:returned_stations) { LocalStations.find(lat_lon, radius) }

    it "returns the n closest stations" do
      returned_stations.map! { |station| station[:id] }
      returned_stations.should include 168
      returned_stations.should_not include 540
    end
  end
end


