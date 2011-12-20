require "test_helper"

module Intuit
  module Integration
    class FindCustomerTest < TestCase
      test "find all customers" do
        customers = Customer.all
        assert !customers.empty?
      end

      test "find by name" do
        customers = Customer.find_by_name("Eugene Bolshakov")
        assert_equal "Eugene Bolshakov", customers.first.name
      end
    end

    class CreateCustomerTest < TestCase
      test "create customer" do
        customer = Customer.new(
          :type       => "Person",
          :name       => "Eugene Bolshakov #{Time.now.to_i}",
          :first_name => "Eugene",
          :last_name  => "Bolshakov",
          :emails     => [
            Email.new(
              :email => "eugene.bolshakov@gmail.com",
              :tag   => "Home"
            )
          ]
        )

        customer.save
        assert customer.id
      end
    end
  end
end
