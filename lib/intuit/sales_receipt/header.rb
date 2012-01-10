module Intuit
  class SalesReceipt
    class Header < Base
      element "DocNumber",      :as => :number
      element "TxnDate",        :as => :date
      element "CustomerId",     :as => :customer_id, :class => Id
      element "CustomerName",   :as => :customer_name
      element "TaxId",          :as => :tax_id, :class => Id
      element "TaxName",        :as => :tax_name
      element "ShipDate",       :as => :ship_date
      element "ShipAddr",       :as => :shipping_address, :class => Address
    end
  end
end
