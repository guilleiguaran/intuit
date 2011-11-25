require "happymapper"
require "active_support/core_ext/string/inflections"

module Intuit
  class Base
    autoload :RetrieveRequest, "intuit/base/retrieve_request"
    autoload :CreateRequest,   "intuit/base/create_request"

    def initialize(params = {})
      params.each do |key, value|
        send("#{key}=", value)
      end
    end

    def save
      new? ? create : update
    end

    def new?
      id.nil?
    end

    private

    def create
      reload self.class.perform_request(:create, self).first
    end

    def update
      raise "Not Implemented"
    end

    def reload(updated)
      self.class.elements.each do |element|
        send("#{element.method_name}=", updated.send(element.method_name))
      end
    end

    class << self
      def all
        perform_request :retrieve
      end

      def perform_request(request, resource = self)
        result = Base.const_get("#{request.to_s.camelize}Request").
          new(Client.client, resource).perform
        parse(result)
      end
    end
  end
end
