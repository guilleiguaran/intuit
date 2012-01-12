require "logger"

module Intuit
  class DefaultLogger
    attr_reader :backend

    def initialize
      @backend = Logger.new(STDERR)
    end

    def request(message, xml)
      backend.debug "***REQUEST***"
      backend.debug message
      backend.debug xml
    end

    def response(message, xml)
      backend.debug "***RESPONSE***"
      backend.debug message
      backend.debug xml
    end
  end
end
