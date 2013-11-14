require 'rspec'

require_relative '../../lib/movember_fetcher'

describe MovemberFetcher do
  describe "#fetch" do
    let(:page_source) { File.open('spec/fixtures/movember_page_source.html') }
    let(:fetcher) { MovemberFetcher.new(1005517, page_source) }

    it "returns the correct team name" do
      expect(fetcher.fetch[:cols][0][:value]).to eq "Pivotal - NYC"
    end

    it "returns the correct team donation total" do
      expect(fetcher.fetch[:cols][1][:value]).to eq "$4,764"
    end
  end
end
