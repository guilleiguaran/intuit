module Intuit
  class Account < Base
    element "Id",      :as => :id,         :class => Id
    element "Name",    :as => :name
    element "Desc",    :as => :description
    element "Type",    :as => :type
    element "Subtype", :as => :subtype

    def self.find_by_type(*types)
      all.select { |a| Array.wrap(types).include?(a.type) }
    end
  end
end
