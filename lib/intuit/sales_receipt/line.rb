module Intuit
  class SalesReceipt
    class Line < Base
      include SAXMachine

      element "Taxable",        :as => :taxable
      element "ItemId",         :as => :item_id,           :class => Id
      element "UnitPrice",      :as => :price
      element "Qty",            :as => :quantity
      element "SalesTaxCodeId", :as => :sales_tax_code_id, :class => Id
      element "DiscountAmount", :as => :discout_amount
      element "DiscountId",     :as => :discount_id,       :class => Id
    end
  end
end
