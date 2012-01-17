require "test_helper"
require "nokogiri"
require "time"

module Intuit
  module Integration
    class SyncStatusTest < TestCase
      test "get sync status" do
        start_time = Time.parse("10 Jan 2012 00:00:00 UTC")
        end_time = Time.parse("11 Jan 2012 23:59:59 UTC")
        statuses = SyncStatus.all(:start_time => start_time, :end_time => end_time)
        assert !statuses.empty?
      end
    end
  end
end
