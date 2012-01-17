module Oembedr
  module Configuration
    # Set a custom User-Agent string (default: Oembedr [Rubygem] #{version})
    attr_accessor :user_agent

    # Select a different http library for Faraday to use (default: Typhoeus)
    attr_accessor :adapter

    # Yield self to be able to configure Oembedr
    #
    # Example:
    #
    #   Oembedr.configure do |configuration|
    #     configuration.user_agent = "MyCoolApp Oembed Client v2.51"
    #     configuration.adapter = :excon
    #   end
    def configure
      yield self
    end

    def user_agent
      @user_agent || "Oembedr Gem #{Oembedr::VERSION}"
    end

    def adapter
      @adapter || :typhoeus
    end

  end
end