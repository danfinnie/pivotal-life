require 'citibikenyc'
require 'dotenv'

Dotenv.load

latitude = ENV['LATITUDE'] || 40.740673
longitude = ENV['LONGITUDE'] || -73.994808
lat_long = [latitude, longitude]
radius = 0.30

bike_counts = Hash.new({ value: 0 })

SCHEDULER.every '60s' do
  stations = LocalStations.find(lat_long, radius)

  stations.each do |station|
    bike_counts[station[:label]] = {
      label: station[:label],
      value: station[:availableBikes]
    }
  end

  send_event('citibikenyc', { items: bike_counts.values })
end

