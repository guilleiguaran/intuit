require "rubygems"
require "bundler/setup"

require "intuit"
require "active_support/test_case"
require "mocha"

class ActiveSupport::TestCase
  include Mocha::API
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
