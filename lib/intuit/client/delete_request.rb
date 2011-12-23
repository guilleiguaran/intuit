require "nokogiri"
require "digest/md5"

class Intuit::Client
  class DeleteRequest
    attr_reader :client, :resource

    def initialize(client, resource)
      @client, @resource = client, resource
    end

    def perform
      client.post(url, xml, headers).body
    end

    private

    def url
      "#{Intuit::Client::DATA_SERVICES_URL}/#{resource.class.element_name.downcase}/v2/#{Intuit::Client.realm_id}"
    end

    def xml
      doc = Nokogiri::XML::Document.new
      attrs = {
        "xmlns:xsi"    => "http://www.w3.org/2001/XMLSchema-instance",
        "xmlns:xsd"    => "http://www.w3.org/2001/XMLSchema",
        "xmlns"        => "http://www.intuit.com/sb/cdm/v2",
        "RequestId"    => request_id
      }
      doc.root = doc.create_element "Del", attrs
      object = doc.create_element "Object"
      object["xsi:type"] = resource.class.element_name
      object << resource.id.to_xml
      doc.root << object
      xml = doc.to_xml
      Intuit.log xml
      xml
    end

    def headers
      { 'Content-Type' => 'text/xml' }
    end

    def request_id
      Digest::MD5.hexdigest("#{Intuit::Client.realm_id}#{Time.now.usec}")
    end
  end
end
