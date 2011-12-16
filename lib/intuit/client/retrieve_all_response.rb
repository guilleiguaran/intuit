class Intuit::Client
  class RetrieveAllResponse
    attr_reader :doc, :klass

    def initialize(xml, klass)
      @doc   = Nokogiri::XML(xml)
      @klass = klass
    end

    def result
      Intuit.log doc.to_xml
      doc.search(klass.element_name).map do |el|
        klass.parse(el.to_s)
      end
    end
  end
end
