class Intuit::Client
  class DeleteResponse
    attr_reader :doc, :resource

    def initialize(xml, resource)
      @doc, @resource = Nokogiri::XML(xml), resource
    end

    def result
      Intuit.log :response, "Delete response", doc.to_xml
      if doc.at("Success")
        true
      else
        raise APIError.new(doc)
      end
    end
  end
end
