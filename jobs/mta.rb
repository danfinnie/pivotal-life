def format_mta_data(mta_client)
  mta_client.trains_by_status.map do |status, trains|
    {
      status: status,
      status_string: status.to_s.gsub('_', ' '),
      trains: trains
    }
  end
end

SCHEDULER.every '60s', first_in: 0 do
  mta_client = MtaClient.new
  send_event('mta', { statuses: format_mta_data(mta_client), trains: mta_client.trains })
end
