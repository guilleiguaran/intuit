require "nokogiri"

class Intuit::Client
  class RetrieveAllRequest
    attr :client, :klass, :filters

    def initialize(client, klass, filters = {})
      @client, @klass, @filters = client, klass, filters
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
          # "ErroredObjectsOnly" => true # This returns objects in error state after failed sync
        }
        xml.send("#{klass.element_name}Query", attrs) do
          filters.each do |key, value|
            xml.send(key, value)
          end
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
