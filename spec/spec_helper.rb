require 'vcr'
require 'bundler'
Bundler.setup(:default, :test)
require 'dashing'
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl' # added via merge
require 'pry' # added via merge
require 'capybara/poltergeist'
require 'simple_bdd'
require 'coveralls' # added via merge
Coveralls.wear! # added via merge

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

Dir.glob(File.expand_path("../../lib/*.rb", __FILE__)).each { |file| require file }

Capybara.current_driver = :poltergeist
Capybara.app = Sinatra::Application.new

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include SimpleBdd, type: :feature
end
