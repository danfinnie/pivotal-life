require 'citibikenyc'
require 'dotenv'

Dotenv.load

lat_long = [ENV['LATITUDE'], ENV['LONGITUDE']]
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

