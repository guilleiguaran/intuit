require "sax-machine"
require "active_support/core_ext/string/inflections"

module Intuit
  autoload :XMLBuilder, "intuit/base/xml_builder"

  class Base
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

    def to_xml
      XMLBuilder.new(self).xml
    end

    private

    def create
      Client.create(self)
    end

    def update
      raise "Not Implemented"
    end

    class << self
      def all
        Client.retrieve_all(self)
      end

      def element_name
        name.to_s.split("::").last
      end
    end
  end
end
