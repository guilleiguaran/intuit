module Intuit
  class Item < Base
    include HappyMapper

    tag "Item"
    element :id,          Integer, :tag => "Id"
    element :name,        String,  :tag => "Name"
    element :description, String,  :tag => "Desc"
    element :active,      Boolean, :tag => "Active"
    element :type,        String,  :tag => "Type"

    def self.find_by_type(*types)
      all.select { |a| Array.wrap(types).include?(a.type) }
    end

    def self.find_by_name(name)
      all.select do |item|
        item.name =~ %r{#{name.downcase}}i
      end
    end
  end
end
