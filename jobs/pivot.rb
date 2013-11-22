require 'json'

pivots = JSON.parse(File.read('assets/javascripts/pivots.json'));
pivots = pivots.select { |pivot| pivot['location_name'] == 'New York' && !pivot['photo_url'].include?('default')}

SCHEDULER.every '24h', first_in: 0 do
  pivot = pivots.sample

  send_event('pivot', {
      name: pivot['first_name'] + ' ' + pivot['last_name'],
      photo_url: pivot['photo_url']
  })
end
