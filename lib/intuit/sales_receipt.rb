module Intuit
  class SalesReceipt < Base
    autoload :Header, "intuit/sales_receipt/header"
    autoload :Line,   "intuit/sales_receipt/line"

    element  "Id",     :as => :id,     :class => Id
    element  "Header", :as => :header, :class => Header
    elements "Line",   :as => :lines,  :class => Line
  end
end
