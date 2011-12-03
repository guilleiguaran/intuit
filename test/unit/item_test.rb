require "test_helper"

module Intuit
  class ItemTest < ActiveSupport::TestCase
    test "find by name" do
      Item.stubs(:all).returns([
        stub(:name => "Foo"), stub(:name => "Bar"), stub(:name => "Foo Bar")
      ])
      items = Item.find_by_name("foo")
      assert_equal ["Foo", "Foo Bar"], items.map(&:name).sort
    end
  end
end
