require "test_helper"

module Intuit
  module Integration
    class FindVendorTest < TestCase
      test "find all vendors" do
        vendors = Vendor.all
        assert !vendors.empty?
      end
    end

    class CreateVendorTest < TestCase
      test "create vendor" do
        vendor = Vendor.new(
          :name => "Vendor #{Time.now.to_i}",
          :type => "Person"
        )

        vendor.save
        assert vendor.id
      end
    end
  end
end
