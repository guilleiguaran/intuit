class Intuit::Client
  class DeleteResponse
    attr_reader :doc, :resource

    def initialize(xml, resource)
      @doc, @resource = Nokogiri::XML(xml), resource
    end

    def result
      if doc.at("Success")
        Intuit.log doc.to_xml
        true
      else
        Intuit.log :warn, doc.to_xml
        raise APIError.new(doc)
      end
    end
  end
end
