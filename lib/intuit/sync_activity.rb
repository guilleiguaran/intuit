require "time"

module Intuit
  class SyncActivity < Base
    autoload :Item, "intuit/sync_activity/item"

    element  "SyncType",            :as => :type
    element  "StartSyncTMS",        :as => :start_time
    element  "EndSyncTMS",          :as => :end_time
    element  "EntityName",          :as => :entity_name
    element  "EntityRowCount",      :as => :entity_row_count
    elements "SyncStatusDrillDown", :as => :items,            :class => Item

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
        "syncActivity"
      end

      def retrieve_request_name
        "SyncActivityRequest"
      end

      def retrieve_response_name
        "SyncActivityResponse"
      end
    end
  end
end
