require "test_helper"

module Intuit
  module Integration
    class FindItemTest < TestCase
      test "find all items" do
        items = Item.all
        assert       !items.empty?
        assert_equal 51, items.first.id
        assert_equal "Inventory", items.first.type
        assert_equal "Medium", items.first.name
        assert_equal "Shopify T-Shirt:Medium", items.first.description
        assert       items.first.active
      end
    end

    class CreateItemTest < TestCase
      test "create item" do
        return
        item = Item.new(
          :name        => "Testing#{Time.now.to_i}",
          :type        => "Expense",
          :subtype     => "Expense",
          :description => "Whatever"
        )
        item.save
        assert !item.id.nil?
      end
    end
  end
end
