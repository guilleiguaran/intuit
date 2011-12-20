module Intuit
  class Address < Base
    element "Id",         :as => :id, :class => Id
    element "Line1",      :as => :line1
    element "Line2",      :as => :line2
    element "City",       :as => :city
    element "County",     :as => :county
    element "Country",    :as => :country
    element "PostalCode", :as => :postal_code
    element "Tag",        :as => :tag
  end
end
