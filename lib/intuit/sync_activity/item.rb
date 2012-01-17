module Intuit
  class SyncActivity
    class Item < Base
      element "SyncEventId",     :as => :event_id
      element "SyncTMS",         :as => :timestamp
      element "EntityId",        :as => :entity_id
      element "RequestId",       :as => :request_id
      element "NgObjectType",    :as => :object_type
      element "OperationType",   :as => :operation_type
      element "SyncMessageCode", :as => :message_code
      element "SyncMessage",     :as => :message
    end
  end
end
