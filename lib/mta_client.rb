require 'active_support/core_ext/hash/conversions'
require 'net/http'

class MtaClient
  STATUSES = [:good_service, :planned_work, :delays, :other]

  def trains
    @trains ||= %w(1 2 3 4 5 6 7 S A C E B D F M G L N Q R J Z)
  end

  def trains_by_status
    @trains_by_status ||= begin
      result = Hash.new([])

      feed_hash.each do |lines_info|
        subway_lines = get_subway_lines(lines_info)
        subway_lines = subway_lines.select { |line| trains.include?(line) }
        result[get_status(lines_info)] += subway_lines
      end

      result
    end
  end

  private

  def feed_hash
    @feed_hash ||= begin
      entire_feed = Hash.from_xml(raw_feed)
      entire_feed["service"]["subway"]["line"]
    end
  end

  def raw_feed
    mta_url = URI('http://www.mta.info/status/serviceStatus.txt')
    Net::HTTP.get(mta_url)
  end

  def get_subway_lines(lines_info)
    name = lines_info['name']
    name == 'SIR' ? ['I'] : name.split(//)
  end

  def get_status(lines_info)
    status = lines_info['status'].gsub(' ', '_').downcase.to_sym

    if STATUSES.include?(status)
      status
    else
      :other
    end
  end
end

