require 'rspec'

require_relative '../../lib/movember_fetcher'

describe MovemberFetcher do
  describe "#fetch" do
    let(:fetcher) { MovemberFetcher.new(1005517) }

    it "returns the correct team name" do
      expect(fetcher.fetch[:label]).to eq "Pivotal - NYC"
    end

    it "returns the correct team donation total" do
      expect(fetcher.fetch[:value]).to eq "$4,764"
    end
  end
end
