module Intuit
  class Id < Base
    include SAXMachine

    attribute "idDomain", :as => :domain
    value :id
  end
end
