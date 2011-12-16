module Intuit
  class Address < Base
    include SAXMachine

    element "Id", :as => :id, :class => Id
    element "Tag", :as => :tag
  end
end
