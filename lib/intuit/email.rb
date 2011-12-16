module Intuit
  class Email < Base
    include SAXMachine

    element "Address", :as => :email
    element "Tag",     :as => :tag
  end
end
