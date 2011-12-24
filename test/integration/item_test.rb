require "test_helper"

module Intuit
  module Integration
    class FindItemTest < TestCase
      test "find all items" do
        items = Item.all
        assert !items.empty?
      end
    end

    class CreateItemTest < TestCase
      test "create parent item" do
        item = Item.new(
          :name           => "Testing#{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD")
        )
        item.save
        assert item.id.id
      end

      test "create subitem" do
        item = Item.new(
          :name           => "Testing#{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD"),
          :parent_id      => Intuit::Id.new(:id => "1", :domain => "QB")
        )
        item.save
        assert item.id.id
      end

      test "create error" do
        item = Item.new(:type => "Inventory")
        assert_raise Client::APIError do
          item.save
        end
      end
    end

    class DeleteItemTest < TestCase
      test "destroy item" do
        item = Item.all.first
        item.destroy
      end
    end
  end
end
