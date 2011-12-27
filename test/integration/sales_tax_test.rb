require "test_helper"

module Intuit
  module Integration
    class FindSalesTaxTest < TestCase
      test "find all sales taxes" do
        taxes = SalesTax.all
        assert !taxes.empty?
      end

      test "find by name" do
        assert SalesTax.find_by_name("Sales Tax")
      end
    end

    class CreateSalesTaxTest < TestCase
      test "create sales tax" do
        tax = SalesTax.new(
          :name        => "Tax #{Time.now.to_i}",
          :tax_rate    => 10,
          :vendor_name => "Agency"
        )

        tax.save
        assert tax.id
      end
    end
  end
end
