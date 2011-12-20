class Intuit::Item
  class AccountRef < Intuit::Base
    element "AccountId",   :as => :id
    element "AccountName", :as => :name
    element "AccountType", :as => :type
  end
end
