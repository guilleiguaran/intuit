module Intuit
  class Client
    class APIError < RuntimeError
      attr_reader :response

      def initialize(response)
        @response = response
      end

      def message
        response.at("ErrorDesc").content
      end
    end
  end
end
