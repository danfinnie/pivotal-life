require 'rspec'

require_relative '../../lib/movember_fetcher'

describe MovemberFetcher do
  describe "#fetch" do
    let(:fetcher) { MovemberFetcher.new(100) }

    it "returns a hash suitable for a Dashing list" do
      expect(fetcher.fetch).to have_key :label
      expect(fetcher.fetch).to have_key :value
    end
  end
end
