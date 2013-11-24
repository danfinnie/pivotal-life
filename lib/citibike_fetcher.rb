require 'citibikenyc'
require 'geocoder'

class CitibikeFetcher
  def self.find(lat_lon, radius)
    Citibikenyc.stations.results.select do |station|
      Geocoder::Calculations.distance_between(lat_lon, [station[:latitude], station[:longitude]]) < radius
    end
  end
end

