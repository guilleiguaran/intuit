module Intuit
  class Account < Base
    include HappyMapper

    tag "Account"
    element :id,          Integer, :tag => "Id"
    element :name,        String,  :tag => "Name"
    element :description, String,  :tag => "Desc"
    element :active,      Boolean, :tag => "Active"
    element :type,        String,  :tag => "Type"
    element :subtype,     String,  :tag => "Subtype"

    def self.find_by_type(*types)
      all.select { |a| Array.wrap(types).include?(a.type) }
    end
  end
end
