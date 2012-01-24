require "test_helper"

module Intuit
  module Integration
    class FindDiscountTest < TestCase
      test "find all discounts" do
        discounts = Discount.all
        assert !discounts.empty?
      end
    end

    class CreateDiscountTest < TestCase
      test "create discount" do
        discount = Discount.new(
          :name                  => "Discount #{Time.now.to_i}",
          :amount                => Intuit::Money.new(:amount => 9.99, :currency_code => "USD"),
          :discount_account_name => "Advertising and Promotion"
        )
        discount.save
        assert discount.id
      end
    end
  end
end
