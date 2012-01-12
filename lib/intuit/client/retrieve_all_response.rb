class Intuit::Client
  class RetrieveAllResponse
    attr_reader :doc, :klass

    def initialize(xml, klass)
      @doc   = Nokogiri::XML(xml)
      @klass = klass
    end

    def result
      Intuit.log :response, "Retrieve response", doc.to_xml
      doc.search(klass.element_name).map do |el|
        klass.parse(el.to_xml)
      end
    end
  end
end
