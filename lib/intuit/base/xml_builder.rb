require "nokogiri"

class Intuit::Base
  class XMLBuilder
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def xml
      doc = Nokogiri::XML::Document.new
      doc.root = doc.create_element(resource.class.element_name)

      # Attributes
      resource.class.sax_config.top_level_attributes.each do |attr|
        attribute = attr.name
        value     = value(attr)
        next if value.nil?

        doc.root[attribute] = value
      end

      # Elements

      # Collect all elements and collections
      elements = {}

      resource.class.columns.each do |column|
        element = column.name
        value   = value(column)

        unless value.nil?
          elements[element] = [value]
        end
      end

      resource.class.sax_config.collection_elements.values.flatten.each do |column|
        element = column.name
        values  = resource.send(column.accessor)

        unless values.empty?
          elements[element] = values
        end
      end

      # Add each one in the correct order
      resource.class.elements_order.each do |element|
        next unless elements[element]
        values = elements[element]
        values.each do |value|
          if value.is_a?(Intuit::Base)
            child = Nokogiri::XML(value.to_xml)
            child.root.name = element
            doc.root << child.root
          else
            doc.root << doc.create_element(element, value)
          end
        end
      end

      # Value
      if !resource.class.sax_config.top_level_element_value.empty?
        value = value(resource.class.sax_config.top_level_element_value.first)
        doc.root.content = value.to_s
      end

      doc.root.to_s
    end

    private

    def builder
      @builder ||= Nokogiri::XML::Builder.new
    end

    def value(el)
      resource.send(el.setter.gsub(/=$/, ''))
    end
  end
end
