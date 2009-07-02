module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_uri(*attrs)
        # Merge given options with defaults.
        options = {
          :on => :save,
          :protocols => %w(http https),
          :allow_blank_protocol => false,
          :allow_blank => false
        }
        options.update(attrs.extract_options!.symbolize_keys)

        # Ensure the :protocols option is a Array of String
        raise ArgumentError, 'A array must be supplied as the :protocols option of the configuration hash' unless options[:protocols].is_a?(Array)
        options[:protocols].collect!(&:to_s)

        # Each attrs
        validates_each(attrs, options) do |record, attr_name, value|
          begin
            uri = URI.parse(value)
          rescue URI::InvalidURIError
            record.errors.add(attr_name, :invalid, :default => options[:message])
          else
            if uri.scheme == nil && !options[:allow_blank_protocol]
              record.errors.add(attr_name, :blank_protocol, :default => options[:blank_protocol])
            elsif !options[:protocols].member?(uri.scheme)
              record.errors.add(attr_name, :invalid_protocol, :default => options[:invalid_protocol])
            end
          end
        end
      end
    end
  end
end

