require "oauth"

module Intuit
  class Client
    INTUIT_OAUTH_URL  = "https://oauth.intuit.com"
    API_URL           = "https://appcenter.intuit.com/api/v1"
    DATA_SERVICES_URL = "https://services.intuit.com/sb"

    class << self
      attr_accessor :token, :secret, :realm_id

      def request_token(callback)
        consumer.get_request_token(:oauth_callback => callback)
      end

      def menu
        client.get("#{API_URL}/Account/AppMenu").body
      end

      def client
        OAuth::AccessToken.new(consumer, token, secret)
      end

      private

      def consumer
        @consumer ||= OAuth::Consumer.new(
          Intuit.oauth_consumer_key,
          Intuit.oauth_consumer_secret,
          :site               => INTUIT_OAUTH_URL,
          :request_token_path => "/oauth/v1/get_request_token",
          :access_token_path  => "/oauth/v1/get_access_token",
          :authorize_url      => "https://workplace.intuit.com/Connect/Begin"
        )
      end
    end
  end
end
