require "nokogiri"

class Intuit::Client
  class RetrieveAllRequest
    attr :client, :klass

    def initialize(client, klass)
      @client, @klass = client, klass
    end

    def perform
      client.post(url, xml, headers).body
    end

    private

    def url
      "#{Intuit::Client::DATA_SERVICES_URL}/#{klass.element_name.downcase}/v2/#{Intuit::Client.realm_id}"
    end

    def xml
      builder = Nokogiri::XML::Builder.new do |xml|
        attrs = {
          "xmlns" => "http://www.intuit.com/sb/cdm/v2"
        }
        xml.send("#{klass.element_name}Query", attrs) do
          # klass.elements.each do |element|
          #   xml.IncludeTagElements "#{klass.tag_name}/#{element.tag}"
          # end
        end
      end

      xml = builder.to_xml
      Intuit.log xml
      xml
    end

    def headers
      { 'Content-Type' => 'text/xml' }
    end
  end
end
