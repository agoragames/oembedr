require "oembedr/providers"
require "uri"

module Oembedr
  class ParsedUrl
    attr_accessor :raw_url, :url

    include Oembedr::Providers

    # TODO: support xml at some point :)
    def initialize the_url
      self.raw_url = the_url
      endpoint = service_endpoint(raw_url)
      if endpoint
        self.url = URI.parse(endpoint.gsub(/\{format\}/, "json"))
      else
        self.url = false
      end
    end

    # Returns the scheme and host portion of the uri, intelligently concatenated
    #
    # Examples
    #
    #   self.new("https://twitter.com/#!/hypomodern").host # => "https://twitter.com"
    #   self.new("http://youtu.be/v/234543").host # => "http://youtube.com"
    #
    # @return url [String]
    def host
      return false unless url
      url.scheme + "://" + url.host
    end

    # Returns the path portion of the uri
    #
    # @return path [String]
    def path
      return false unless url
      url.path
    end
  end
end