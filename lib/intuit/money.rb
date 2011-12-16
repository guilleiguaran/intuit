module Intuit
  class Money < Base
    include SAXMachine

    element "CurrencyCode", :as => :currency_code
    element "Amount",       :as => :amount
  end
end
