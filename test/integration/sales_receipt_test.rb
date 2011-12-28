require "test_helper"

module Intuit
  module Integration
    class FindSalesReceiptTest < TestCase
      test "find all sales receipts" do
        receipts = SalesReceipt.all
        assert !receipts.empty?
      end

      test "find by date" do
        receipts = SalesReceipt.find_by_date("2011-12-21")
        assert !receipts.empty?
      end
    end

    class CreateSalesReceiptTest < TestCase
      test "create sales receipt" do
        receipt = SalesReceipt.new

        receipt.header = SalesReceipt::Header.new(
          :number           => "#1282",
          :date             => "2011-12-21",
          :customer_id      => Id.new(:id => "10", :domain => "QB"),
          :shipping_address => Intuit::Address.new(
            :city        => "Ottawa",
            :county      => "Ontario",
            :country     => "Canada",
            :line1       => "138 Clarence St",
            :line2       => "Apartment 1",
            :postal_code => "K1N5P8"
          ),
          :tax_id           => Id.new(:id => "74", :domain => "QB")
        )
        receipt.lines = [
          SalesReceipt::Line.new(
            :item_id  => Id.new(:id => "2078204", :domain => "NG"),
            :price    => 25.99,
            :quantity => 1
          ),
          SalesReceipt::Line.new(
            :item_id => Id.new(:id => "3", :domain => "QB"),
            :amount  => 3.33
          ),
          SalesReceipt::Line.new(
            :item_id => Id.new(:id => "75", :domain => "QB"),
            :amount  => 0.5
          )
        ]

        receipt.save
        assert receipt.id.id
      end
    end
  end
end
