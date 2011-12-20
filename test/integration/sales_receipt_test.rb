require "test_helper"

module Intuit
  module Integration
    class FindSalesReceiptTest < TestCase
      test "find all sales receipts" do
        receipts = SalesReceipt.all
        assert !receipts.empty?
      end
    end

    class CreateSalesReceiptTest < TestCase
      test "create sales receipt" do
        receipt = SalesReceipt.new
        receipt.header = SalesReceipt::Header.new(
          :number           => Time.now.to_i,
          :date             => Date.today.to_s,
          :customer_id      => Id.new(:id => "1", :domain => "QB"),
          :shipping_address => Intuit::Address.new(
            :city        => "Ottawa",
            :county      => "Ontario",
            :country     => "Canada",
            :line1       => "138 Clarence St",
            :line2       => "Apartment 1",
            :postal_code => "K1N5P8"
          )
        )
        receipt.lines = [
          SalesReceipt::Line.new(
            :item_id  => Id.new(:id => 2, :domain => "QB"),
            :price    => 66,
            :quantity => 2
          ),
          SalesReceipt::Line.new(
            :item_id  => Id.new(:id => 2, :domain => "QB"),
            :price    => 44,
            :quantity => 1
          )
        ]

        receipt.save
        assert receipt.id
      end
    end
  end
end
