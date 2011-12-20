module Intuit
  class Money < Base
    element "CurrencyCode", :as => :currency_code
    element "Amount",       :as => :amount
  end
end
