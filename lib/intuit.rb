require "intuit/version"

module Intuit
  autoload :Client,  "intuit/client"
  autoload :Base,    "intuit/base"
  autoload :Account, "intuit/account"
  autoload :Item,    "intuit/item"

  # Configuration

  class << self
    attr_accessor :oauth_consumer_key
    attr_accessor :oauth_consumer_secret
    attr_accessor :app_token
  end
end
