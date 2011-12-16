require "intuit/version"
require "logger"

module Intuit
  autoload :Client,       "intuit/client"
  autoload :Base,         "intuit/base"
  autoload :Id,           "intuit/id"
  autoload :Money,        "intuit/money"
  autoload :Account,      "intuit/account"
  autoload :Item,         "intuit/item"
  autoload :SalesReceipt, "intuit/sales_receipt"
  autoload :Address,      "intuit/address"
  autoload :Customer,     "intuit/customer"
  autoload :Email,        "intuit/email"

  # Configuration

  class << self
    attr_accessor :oauth_consumer_key
    attr_accessor :oauth_consumer_secret
    attr_accessor :app_token

    attr_writer :logger

    def logger
      @logger ||= Logger.new(STDERR)
    end

    attr_writer :log

    def log?
      !!@log
    end

    def log(message)
      logger.debug(message) if log?
    end
  end

  self.log = true
end
