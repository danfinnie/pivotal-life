SCHEDULER.every '5s' do
  movember_teams = [1009381, 1005517, 1124333, 1007149, 1003469, 1005669]
  fetched_values = movember_teams.map { |team_number| MovemberFetcher.new(team_number).fetch }
  send_event('movember', { items: fetched_values })
end
