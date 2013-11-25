require 'spec_helper'

describe MovemberFetcher do
  describe "#fetch", :vcr do
    let(:fetcher) { MovemberFetcher.new(1005517) }

    it "returns the correct team name" do
      expect(fetcher.fetch[:cols][0][:value]).to eq "Pivotal Labs - NYC"
    end

    it "returns the correct team size" do
      expect(fetcher.fetch[:cols][1][:value]).to eq "21"
    end

    it "returns the correct team donation total" do
      expect(fetcher.fetch[:cols][2][:value]).to eq "$9,001"
    end
  end
end
