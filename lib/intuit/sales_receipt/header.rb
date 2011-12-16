module Intuit
  class SalesReceipt
    class Header < Base
      include SAXMachine

      element "DocNumber",      :as => :number
      element "TxnDate",        :as => :date
      element "CustomerId",     :as => :customer_id, :class => Id
      element "SalesTaxCodeId", :as => :sales_tax_code_id, :class => Id
      element "ShipDate",       :as => :ship_date
      element "ShipAddr",       :as => :shipping_address, :class => Address
    end
  end
end
