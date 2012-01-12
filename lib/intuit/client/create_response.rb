class Intuit::Client
  class CreateResponse
    attr_reader :doc, :resource

    def initialize(xml, resource)
      @doc, @resource = Nokogiri::XML(xml), resource
    end

    def result
      Intuit.log :response, "Create response", doc.to_xml
      if doc.at("Success")
        update_resource
        true
      else
        raise APIError.new(doc)
      end
    end

    private

    def update_resource
      object_xml  = doc.at("Success").children.first.to_xml
      resource.id = resource.class.parse(object_xml).id
      # The above requires FullResponse to be returned,
      # which is currently disabled
      # created = resource.class.parse(xml)
      # created.class.columns.each do |column|
      #   resource.send(column.setter, created.send(column.setter.gsub(/=$/, '')))
      # end
    end
  end
end
