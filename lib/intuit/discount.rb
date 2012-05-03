module Intuit
  class Discount < Base
    element "Id",                  :as => :id,                    :class => Id
    element "Name",                :as => :name
    element "Desc",                :as => :description
    element "Active",              :as => :active
    element "Percent",             :as => :percent
    element "Amount",              :as => :amount
    element "DiscountAccountId",   :as => :discount_account_id
    element "DiscountAccountName", :as => :discount_account_name
  end
end
