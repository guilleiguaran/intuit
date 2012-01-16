module Intuit
  class Id < Base
    attribute "idDomain", :as => :domain
    value :id

    def to_s
      "#{id}:#{domain}"
    end
  end
end
