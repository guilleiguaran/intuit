class Intuit::Client
  class CreateResponse
    attr_reader :xml, :resource

    def initialize(xml, resource)
      @xml, @resource = xml, resource
    end

    def result
      Intuit.log xml
      created = resource.class.parse(xml)
      created.class.columns.each do |column|
        resource.send(column.setter, created.send(column.setter.gsub(/=$/, '')))
      end
      true
    end
  end
end
