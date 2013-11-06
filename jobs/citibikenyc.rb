require 'citibikenyc'

lat_long = [40.74033720000001, -73.9951462]
radius = 1.0

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

