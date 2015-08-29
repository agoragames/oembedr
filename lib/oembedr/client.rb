require "oembedr/parsed_url"
require "faraday_middleware"

module Oembedr
  class Client
    attr_accessor :resource_url, :parsed_url

    def initialize url
      self.resource_url = url
      self.parsed_url = ParsedUrl.new(url)

    end

    # Sets up a Faraday::Connection object
    #
    # @param options [optional]
    #
    # @return Faraday::Connection
    def connection options = {}
      the_options = {
        :headers => {
          "Accept" => "application/json",
          "User-Agent" => Oembedr.user_agent
        },
        :url => parsed_url.host
      }.merge(options)

      Faraday.new(the_options) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::ParseJson
        builder.use Faraday::Response::RaiseError
        builder.use FaradayMiddleware::FollowRedirects
        builder.adapter Oembedr.adapter
      end
    end

    # Requests the oembeddable resource
    #
    # @return Faraday::Response
    def get options = {}
      additional_params = options.delete(:params) || {}
      connection(options).get do |req|
        req.url parsed_url.path
        req.params = additional_params.merge({
          :url => resource_url,
          :format => "json"
        })
      end
    end

    # Returns a boolean true/false if we can process this request
    #
    # @return Boolean
    def ready?
      !!parsed_url.host
    end

  end
end