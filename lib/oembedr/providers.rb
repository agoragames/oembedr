module Oembedr
  module Providers

    # from ruby-oembed with a couple more I know of from user feedback :).
    LIST = {
      /(yotu\.be|youtube)/ => "http://www.youtube.com/oembed",
      /(flic\.kr|flickr)/ => "http://www.flickr.com/services/oembed/",
      /viddler/ => "http://lab.viddler.com/services/oembed/",
      /qik/ => "http://qik.com/api/oembed.{format}",
      /revision3/ => "http://revision3.com/api/oembed/",
      /hulu/ => "http://www.hulu.com/api/oembed.{format}",
      /vimeo/ => "http://www.vimeo.com/api/oembed.{format}",
      /instagr.am/ => "http://api.instagram.com/oembed",
      /slideshare/ => "http://www.slideshare.net/api/oembed/2",
      /(mlg\.tv|tv\.majorleaguegaming)/ => "http://tv.majorleaguegaming.com/oembed",
      /yfrog/ => "http://www.yfrog.com/api/oembed",
      /blip\.tv/ => "http://blip.tv/oembed/",
      /opera\.com/ => 'http://my.opera.com/service/oembed',
      /skitch\.com/ => 'http://skitch.com/oembed',
      /twitch\.tv/ => false, # OMG! Support OEmbed!
      /twitter\.com/ => 'https://api.twitter.com/1/statuses/oembed.{format}',
      /dailymotion\.com/ => 'http://www.dailymotion.com/api/oembed/',
      /scribd\.com/ => 'http://www.scribd.com/services/oembed',
      /dotsub\.com/ => 'http://dotsub.com/services/oembed',
      /clikthrough\.com/ => 'http://clikthrough.com/services/oembed',
      /kinomap\.com/ => 'http://www.kinomap.com/oembed',
      /photobucket\.com/ => 'http://photobucket.com/oembed'
      # ...
    }

    # Locate the correct service endpoint for the given resource URL.
    #
    # @param url [String] a fully-qualified URL to an oembeddable resource
    #
    # @return the url, or false if no known endpoint.
    def service_endpoint url
      endpoint = LIST.find do |(pattern, endpoint)|
        pattern.match(url)
      end
      endpoint ? endpoint.last : false
    end

    # Return a boolean true or false if we can handle the given domain
    #
    # @param url [String] a fully-qualified URL to an oembeddable resource
    #
    # @return Boolean
    def known_service? url
      !!service_endpoint(url)
    end

  end
end