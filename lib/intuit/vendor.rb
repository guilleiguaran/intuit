module Intuit
  class Vendor < Base
    element "Id",     :as => :id,   :class => Id
    element "TypeOf", :as => :type
    element "Name",   :as => :name
  end
end
