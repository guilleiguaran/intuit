module Intuit
  class SalesReceipt
    class Line < Base
      element "Taxable",        :as => :taxable
      element "Amount",         :as => :amount
      element "ItemId",         :as => :item_id,           :class => Id
      element "UnitPrice",      :as => :price
      element "Qty",            :as => :quantity
      element "DiscountAmount", :as => :discout_amount
      element "DiscountId",     :as => :discount_id,       :class => Id
    end
  end
end
