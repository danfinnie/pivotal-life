require 'citibikenyc'
require 'geocoder'

class LocalStations
  def self.find(lat_lon, radius)
    stations = Citibikenyc.stations

    nearby_stations = stations.results.select do |station|
      Geocoder::Calculations.distance_between(lat_lon, [station[:latitude], station[:longitude]]) < radius
    end
  end
end

