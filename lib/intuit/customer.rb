module Intuit
  class Customer < Base
    include SAXMachine

    element  "Id",         :as => :id,            :class => Id
    element  "TypeOf",     :as => :type
    element  "Address",    :as => :address,       :class => Address
    elements "Email",      :as => :emails,        :class => Email
    element  "GivenName",  :as => :first_name
    element  "FamilyName", :as => :last_name
    element  "MiddleName", :as => :middle_name
    element  "Name",       :as => :name
  end
end
