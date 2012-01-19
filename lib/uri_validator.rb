class UriValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
  
    protocols = options[:protocols].join('|') || %w(http https).join('|')
    
    # check if value not match regex is true return error, example protocols "http|https"
    if value !~ %r{^(#{protocols})://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$}
      record.errors.add(attribute, options[:message])
    end
  end
end
