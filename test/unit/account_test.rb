require "test_helper"

module Intuit
  class AccountTest < ActiveSupport::TestCase
    test "find by type" do
      Account.stubs(:all).returns([
        stub(:type => "Liability"), stub(:type => "Expense"), stub(:type => "Whatever")
      ])
      accounts = Account.find_by_type("Liability")
      assert_equal ["Liability"], accounts.map(&:type).uniq
    end

    test "find accounts by multiple types" do
      Account.stubs(:all).returns([
        stub(:type => "Liability"), stub(:type => "Expense"), stub(:type => "Whatever")
      ])
      accounts = Account.find_by_type("Liability", "Expense")
      assert_equal ["Expense", "Liability"], accounts.map(&:type).uniq.sort
    end
  end
end
