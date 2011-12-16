class Intuit::Client
  class CreateResponse
    attr_reader :doc, :resource

    def initialize(xml, resource)
      @doc, @resource = Nokogiri::XML(xml), resource
    end

    def result
      Intuit.log doc.to_xml
      if doc.at("Success")
        update_resource
        true
      else
        false
      end
    end

    private

    def update_resource
      created = resource.class.parse(doc.at("ObjectRef").to_xml)
      resource.id = created.id
      # The above requires FullResponse to be returned,
      # which is currently disabled
      # created = resource.class.parse(xml)
      # created.class.columns.each do |column|
      #   resource.send(column.setter, created.send(column.setter.gsub(/=$/, '')))
      # end
    end
  end
end
