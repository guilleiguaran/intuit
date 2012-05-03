require "nokogiri"

class Intuit::Client
  class RetrieveAllRequest
    attr :client, :klass, :filters, :errored

    def initialize(client, klass, filters = {}, errored = false)
      @client, @klass, @filters, @errored = client, klass, filters, errored
    end

    def perform
      client.post(url, xml, headers).body
    end

    private

    def url
      "#{Intuit::Client::DATA_SERVICES_URL}/#{klass.request_uri}/v2/#{Intuit::Client.realm_id}"
    end

    def xml
      builder = Nokogiri::XML::Builder.new do |xml|
        attrs = { "xmlns" => "http://www.intuit.com/sb/cdm/v2" }

        if errored
          # This returns objects in error state after failed sync
          attrs["ErroredObjectsOnly"] = true
        end

        xml.send("#{klass.retrieve_request_name}", attrs) do
          filters.each do |key, value|
            xml.send(key, value)
          end
        end
      end

      xml = builder.to_xml
      Intuit.log :request, "Retrieve request", xml
      xml
    end

    def headers
      { 'Content-Type' => 'text/xml' }
    end
  end
end
