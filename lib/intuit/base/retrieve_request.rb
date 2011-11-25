require "nokogiri"

module Intuit
  class Base
    class RetrieveRequest
      attr :client, :klass

      def initialize(client, klass)
        @client, @klass = client, klass
      end

      def perform
        client.post(url, xml, headers).body
      end

      private

      def url
        "#{Client::DATA_SERVICES_URL}/#{klass.tag_name.downcase}/v2/#{Client.realm_id}"
      end

      def xml
        builder = Nokogiri::XML::Builder.new do |xml|
          attrs = { "xmlns" => "http://www.intuit.com/sb/cdm/v2" }
          xml.send("#{klass.tag_name}Query", attrs) do
            klass.elements.each do |element|
              xml.IncludeTagElements "#{klass.tag_name}/#{element.tag}"
            end
          end
        end

        builder.to_xml
      end

      def headers
        { 'Content-Type' => 'text/xml' }
      end
    end
  end
end
