require 'vcr'

require_relative '../lib/google_calendar'
require_relative '../lib/local_stations'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

