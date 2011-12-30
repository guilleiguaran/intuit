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
        parent = Item.all.first
        item = Item.new(
          :name           => "Testing#{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD"),
          :parent_id      => parent.id,
          :parent_name    => parent.name
        )
        item.save
        assert item.id.id
      end

      test "multiple subitems" do
        parent = Item.new(
          :name           => "Parent #{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD")
        )
        parent.save

        child1 = Item.new(
          :name           => "Child #{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD"),
          :parent_id      => parent.id,
          :parent_name    => parent.name
        )
        child1.save

        child2 = Item.new(
          :name           => "Child #{Time.now.to_i}",
          :type           => "Inventory",
          :income_account => Item::AccountRef.new(:name => "Special Services Income"),
          :asset_account  => Item::AccountRef.new(:name => "Inventory Asset"),
          :cogs_account   => Item::AccountRef.new(:name => "Cost of Goods Sold"),
          :purchase_cost  => Money.new(:amount => 0, :currency_code => "USD"),
          :price          => Money.new(:amount => 1, :currency_code => "USD"),
          :parent_id      => parent.id,
          :parent_name    => parent.name
        )
        child2.save
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
