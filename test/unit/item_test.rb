require "test_helper"

module Intuit
  class ItemTest < ActiveSupport::TestCase
    test "full_name" do
      item = Item.new(:name => "Boss", :parent_name => "Hugo")
      assert_equal "Hugo:Boss", item.full_name
    end
  end

  class FindByNameItemTest < ActiveSupport::TestCase
    setup do
      Item.stubs(:all).returns([
        stub(:full_name => "Foo"),
        stub(:full_name => "Foo:Bar"),
        stub(:full_name => "Bar:Baz")
      ])
    end

    test "find by one word" do
      items = Item.find_by_name("foo")
      assert_equal ["Foo", "Foo:Bar"], items.map(&:full_name).sort
    end

    test "find by two words" do
      items = Item.find_by_name("foo bar")
      assert_equal ["Foo:Bar"], items.map(&:full_name)
    end

    test "find by words in arbitrary order" do
      items = Item.find_by_name("bar foo")
      assert_equal ["Foo:Bar"], items.map(&:full_name)
    end
  end

  class FindByTypeItemTest < ActiveSupport::TestCase
    setup do
      Item.stubs(:all).returns([
        stub(:type => "Inventory"),
        stub(:type => "Product"),
        stub(:type => "Other Charge")
      ])
    end

    test "find by one type" do
      items = Item.find_by_type("Product")
      assert_equal ["Product"], items.map(&:type)
    end

    test "find by multiple types" do
      items = Item.find_by_type("Inventory", "Other Charge")
      assert_equal ["Inventory", "Other Charge"], items.map(&:type)
    end
  end
end
