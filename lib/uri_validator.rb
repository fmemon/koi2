# require 'net/http'
# 
# # Thanks Ilya! http://www.igvita.com/2006/09/07/validating-url-in-ruby-on-rails/
# # Original credits: http://blog.inquirylabs.com/2006/04/13/simple-uri-validation/
# # HTTP Codes: http://www.ruby-doc.org/stdlib/libdoc/net/http/rdoc/classes/Net/HTTPResponse.html
# 
# class UriValidator < ActiveModel::EachValidator
#   def validate_each(object, attribute, value)
#     raise(ArgumentError, "A regular expression must be supplied as the :format option of the options hash") unless options[:format].nil? or options[:format].is_a?(Regexp)
#     configuration = { :message => "is invalid or not responding", :format => URI::regexp(%w(http https)) }
#     configuration.update(options)
#     
#     if value =~ configuration[:format]
#       begin # check header response
#         case Net::HTTP.get_response(URI.parse(value))
#           when Net::HTTPSuccess then true
#           else object.errors.add(attribute, configuration[:message]) and false
#         end
#       rescue # Recover on DNS failures..
#         object.errors.add(attribute, configuration[:message]) and false
#       end
#     else
#       object.errors.add(attribute, configuration[:message]) and false
#     end
#   end
# end
# 
# Require this file, or put this in where Rails will auto load it.
class UriValidator < ActiveModel::EachValidator
  def initialize(options)
    super

    @domain = options[:domain]
    @permissible_schemes = options[:schemes] || %w(http https)
    @error_message = options[:message] || 'is not a valid url'
  end

  def validate_each(record, attribute, value)
    if URI::regexp(@permissible_schemes).match(value)
      begin
        uri = URI.parse(value)
        if @domain
          record.errors.add(attribute, 'does not belong to domain', :value => value) unless uri.host == @domain || uri.host.ends_with?(".#{@domain}")
        end
      rescue URI::InvalidURIError
        record.errors.add(attribute, @error_message, :value => value)
      end
    else
      record.errors.add(attribute, @error_message, :value => value)
    end
  end
end
