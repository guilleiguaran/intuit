require "test_helper"

module Intuit
  module Integration
    class FindAccountTest < TestCase
      test "find all accounts" do
        accounts = Account.all
        assert !accounts.empty?
      end

      test "find accounts by type" do
        accounts = Account.find_by_type("Liability")
        assert_equal ["Liability"], accounts.map(&:type).uniq
      end

      test "find accounts by multiple types" do
        accounts = Account.find_by_type("Liability", "Expense")
        assert_equal ["Expense", "Liability"], accounts.map(&:type).uniq.sort
      end
    end

    class CreateAccountTest < TestCase
      test "create account" do
        account = Account.new(
          :name        => "Testing#{Time.now.to_i}",
          :type        => "Expense",
          :subtype     => "Expense",
          :description => "Whatever"
        )
        account.save
        assert !account.id.nil?
      end
    end
  end
end
