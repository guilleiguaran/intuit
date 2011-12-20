module Intuit
  class Address < Base
    include SAXMachine

    element "Id",         :as => :id, :class => Id
    element "Tag",        :as => :tag
    element "Line1",      :as => :line1
    element "Line2",      :as => :line2
    element "City",       :as => :city
    element "County",     :as => :county
    element "Country",    :as => :country
    element "PostalCode", :as => :postal_code
  end
end
