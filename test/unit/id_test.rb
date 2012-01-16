require "test_helper"

module Intuit
  class IdTest < ActiveSupport::TestCase
    test "to_s" do
      id = Intuit::Id.new(:id => "123", :domain => "NG")
      assert_equal "123:NG", id.to_s
    end
  end
end
