module Intuit
  class Email < Base
    element "Address", :as => :email
    element "Tag",     :as => :tag
  end
end
