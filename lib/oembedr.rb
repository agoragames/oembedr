require "oembedr/version"
require "oembedr/configuration"
require "oembedr/client"
require "oembedr/providers"
require "typhoeus"

module Oembedr
  extend Configuration
  extend Providers

  # Convience method: fetch me an oembed!
  #
  # Example:
  #   Oembedr.fetch("http://www.youtube.com/watch?v=b9XsTtFu64Y")
  #   Oembedr.fetch("http://www.youtube.com/watch?v=b9XsTtFu64Y",
  #                   :params => { :maxwidth => "150", :maxheight => "100" })
  #
  # @return Faraday::Response or raises error
  def self.fetch url, options = {}
    client = Oembedr::Client.new(url)
    if client.ready?
      client.get(options)
    else
      false
    end
  end
end
