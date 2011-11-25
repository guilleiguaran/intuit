require "nokogiri"
require "digest/md5"

module Intuit
  class Base
    class CreateRequest
      attr_reader :client, :resource

      def initialize(client, resource)
        @client = client, @resource = resource
      end

      def perform
        Client.client.post(url, xml, headers).body
      end

      private

      def url
        "#{Client::DATA_SERVICES_URL}/#{resource.class.tag_name.downcase}/v2/#{Client.realm_id}"
      end

      def xml
        builder = Nokogiri::XML::Builder.new do |xml|
          attrs = {
            "xmlns:xsi"    => "http://www.w3.org/2001/XMLSchema-instance",
            "xmlns:xsd"    => "http://www.w3.org/2001/XMLSchema",
            "xmlns"        => "http://www.intuit.com/sb/cdm/v2",
            "RequestId"    => request_id,
            "FullResponse" => true
          }
          xml.Add(attrs) do
            xml.Object("xsi:type" => resource.class.tag_name) do
              resource.class.elements.each do |element|
                key   = element.tag
                value = resource.send(element.method_name)

                if value
                  xml.send(key, value)
                end
              end
            end
          end
        end

        builder.to_xml
      end

      def headers
        { 'Content-Type' => 'text/xml' }
      end

      def request_id
        Digest::MD5.hexdigest("#{Client.realm_id}#{Time.now.usec}")
      end
    end
  end
end
