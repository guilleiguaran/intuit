require "sax-machine"
require "active_support/core_ext/string/inflections"

module Intuit
  autoload :XMLBuilder, "intuit/base/xml_builder"

  class Base
    include SAXMachine

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

    def destroy
      Client.delete(self)
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
      def all(filters = {}, errored = false)
        Client.retrieve_all(self, filters, errored)
      end

      def find_by_name(name)
        all.select { |i| i.name == name }
      end

      def element_name
        name.to_s.split("::").last
      end

      def elements_order
        @elements_order ||= []
      end

      # Monkeypatching SAXMachine to populate elements_order

      alias :sax_machine_element :element
      alias :sax_machine_elements :elements

      def element(name, options)
        elements_order << name
        sax_machine_element(name, options)
      end

      def elements(name, options)
        elements_order << name
        sax_machine_elements(name, options)
      end

      # Intuit Query-specific stuff

      def request_uri
        element_name.downcase
      end

      def retrieve_request_name
        "#{element_name}Query"
      end

      def retrieve_response_name
        element_name
      end
    end
  end
end
