require "time"

module Intuit
  class SyncStatus < Base
    element "NgId",         :as => :object_id
    element "NgObjectType", :as => :object_type
    element "RequestId",    :as => :request_id
    element "StateCode",    :as => :state_code
    element "StateDesc",    :as => :state
    element "MessageCode",  :as => :message_code
    element "MessageDesc",  :as => :message

    class << self
      def all(time_filters)
        filters = {
          :OfferingId      => "ipp",
          :StartCreatedTMS => time_filters[:start_time].utc.xmlschema,
          :EndCreatedTMS   => time_filters[:end_time].utc.xmlschema
        }
        super filters
      end

      # Intuit Query-specific stuff

      def request_uri
        "status"
      end

      def retrieve_request_name
        "SyncStatusRequest"
      end

      def retrieve_response_name
        "SyncStatusResponse"
      end
    end
  end
end
