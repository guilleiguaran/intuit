require "intuit/version"

module Intuit
  autoload :DefaultLogger, "intuit/default_logger"
  autoload :Client,        "intuit/client"
  autoload :Base,          "intuit/base"
  autoload :Id,            "intuit/id"
  autoload :Money,         "intuit/money"
  autoload :Account,       "intuit/account"
  autoload :Item,          "intuit/item"
  autoload :SalesReceipt,  "intuit/sales_receipt"
  autoload :Address,       "intuit/address"
  autoload :Customer,      "intuit/customer"
  autoload :Email,         "intuit/email"
  autoload :SalesTax,      "intuit/sales_tax"
  autoload :Vendor,        "intuit/vendor"
  autoload :SyncActivity,  "intuit/sync_activity"

  # Configuration

  class << self
    attr_accessor :oauth_consumer_key
    attr_accessor :oauth_consumer_secret
    attr_accessor :app_token

    attr_writer :logger

    def logger
      @logger ||= DefaultLogger.new
    end

    attr_writer :log

    def log?
      !!@log
    end

    def log(action, message, details)
      logger.send(action, message, details) if log?
    end
  end

  self.log = true
end
