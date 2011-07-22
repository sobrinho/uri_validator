class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    protocols = options[:protocols] || %w(http https)
    
    if value !~ %r{^(#{Array.wrap(protocols).join('|')})://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$}
      record.errors.add(attribute, options[:message] || :invalid_uri)
    end
  end
end
