require 'vcr'
require 'bundler'
Bundler.setup(:default, :test)
require 'dashing'
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'simple_bdd'

require_relative '../lib/google_calendar'
require_relative '../lib/local_stations'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

Capybara.current_driver = :poltergeist
Capybara.app = Sinatra::Application.new

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

RSpec.configure do |config|
  config.include SimpleBdd, type: :feature
end
