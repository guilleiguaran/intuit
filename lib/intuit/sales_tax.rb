module Intuit
  class SalesTax < Base
    element "Id",         :as => :id,         :class => Id
    element "Name",       :as => :name
    element "Desc",       :as => :description
    element "TaxRate",    :as => :tax_rate
    element "VendorId",   :as => :vendor_id,  :class => Id
    element "VendorName", :as => :vendor_name
  end
end
