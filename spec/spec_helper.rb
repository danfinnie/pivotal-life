require 'vcr'
require 'bundler'
Bundler.setup(:default, :test)
require 'dashing'
require 'rspec'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'simple_bdd'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

Capybara.current_driver = :poltergeist
Capybara.app = Sinatra::Application.new

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

RSpec.configure do |config|
  config.include SimpleBdd, type: :feature
end
