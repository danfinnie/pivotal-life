require 'spec_helper'

describe MtaClient do
  let(:mta_client) { MtaClient.new }

  describe "::STATUSES" do
    subject { MtaClient::STATUSES }
    it { should match_array %i(good_service planned_work delays other) }
  end

  describe "#trains" do
    subject { mta_client.trains }

    it { should == %w(1 2 3 4 5 6 7 S A C E B D F M G L N Q R J Z) }
  end

  describe "#trains_by_status" do
    subject do
      VCR.use_cassette('MtaClient/service_status') { mta_client.trains_by_status }
    end

    it "returns a hash of all current train statuses and the trains associated with them" do
      expect(subject[:good_service]).to match_array %w(7 A C E B D F G M J Z L S)
      expect(subject.keys).not_to include :planned_work
      expect(subject[:delays]).to match_array %w(1 2 3 4 5 6)
      expect(subject[:other]).to match_array %w(N Q R)
    end
  end
end

