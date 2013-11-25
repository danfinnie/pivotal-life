require 'vcr'
require 'bundler'
Bundler.setup(:default, :test)
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'pry'
require 'capybara/poltergeist'
require 'simple_bdd'
require 'coveralls'
Coveralls.wear!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
end

require 'rufus/scheduler'

class Rufus::Scheduler

class Rufus::Scheduler::Job
  alias :old_initialize :initialize
  def initialize(*args, &block)
    old_initialize(*args) do |*blk_args|
      $stderr.puts caller.inspect
      VCR.use_cassette("dashing_jobs", record: :new_episodes) do
        block.call(*blk_args)
      end
    end
  end
end
require 'dashing'

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
