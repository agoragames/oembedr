module Oembedr
  module Providers

    # from ruby-oembed with a couple more I know of from user feedback :).
    LIST = {
      # Video
      /(youtu\.be|youtube)/ => "http://www.youtube.com/oembed",
      /viddler/ => "http://www.viddler.com/oembed/",
      /qik/ => "http://qik.com/api/oembed.{format}",
      /revision3/ => "http://revision3.com/api/oembed/",
      /hulu/ => "http://www.hulu.com/api/oembed.{format}",
      /vimeo/ => "http://vimeo.com/api/oembed.{format}",
      /(mlg\.tv|tv\.majorleaguegaming)/ => "http://tv.majorleaguegaming.com/oembed",
      /twitch\.tv/ => 'http://api.twitch.tv/api/embed/',
      /dailymotion\.com/ => 'http://www.dailymotion.com/api/oembed/',
      /dotsub\.com/ => 'http://dotsub.com/services/oembed',
      /clikthrough\.com/ => 'http://clikthrough.com/services/oembed',
      /movieclips\.com/ => 'http://movieclips.com/services/oembed/',
      /ustream\.tv/ => 'http://www.ustream.tv/oembed',
      /blip\.tv/ => 'http://blip.tv/oembed',
      /nfb\.ca/ => 'http://www.nfb.ca/remote/services/oembed/',
      /bambuser\.com/ => 'http://api.bambuser.com/oembed/iframe.{format}',
      /justin\.tv/ => 'http://api.justin.tv/api/embed/from_url.{format}',
      /wordpress\.tv/ => 'http://wordpress.tv/oembed/',
      /collegehumor\.com/ => 'http://www.collegehumor.com/oembed.{format}',

      # Audio
      /soundcloud\.com/ => 'http://soundcloud.com/oembed',
      /open\.spotify\.com/ => 'https://embed.spotify.com/oembed/',
      /(rdio\.com|rd\.io)/ => 'http://www.rdio.com/api/oembed/',

      # Image
      /(deviantart\.com|fav\.me)/ => 'http://backend.deviantart.com/oembed',
      /(flic\.kr|flickr)/ => "http://www.flickr.com/services/oembed/",
      /(instagr\.am|instagram\.com)/ => "http://api.instagram.com/oembed",
      /yfrog/ => "http://www.yfrog.com/api/oembed",
      /skitch\.com/ => 'http://skitch.com/oembed',
      /photobucket\.com/ => 'http://photobucket.com/oembed',

      # Rich
      /slideshare/ => "http://www.slideshare.net/api/oembed/2",
      /twitter\.com/ => 'https://api.twitter.com/1/statuses/oembed.{format}',
      /scribd\.com/ => 'http://www.scribd.com/services/oembed',
      /kinomap\.com/ => 'http://www.kinomap.com/oembed',
      /speakerdeck\.com/ => 'https://speakerdeck.com/oembed.{format}',
      /polldaddy\.com/ => 'http://polldaddy.com/oembed/',
      /polleverywhere\.com/ => 'http://www.polleverywhere.com/services/oembed/',
      /gmep\.org/ => 'https://gmep.org/oembed.{format}',
      /cacoo\.com/ => 'http://cacoo.com/oembed.{format}',
      /dailymile\.com/ => 'http://api.dailymile.com/oembed',
      /dipity\.com/ => 'http://www.dipity.com/oembed/timeline/',
      /sketchfab\.com\/show/ => 'http://sketchfab.com/oembed',
      /ifixit\.com/ => 'http://www.ifixit.com/Embed',
      /(wordpress\.com|blogs\.cnn\.com|techcrunch\.com|wp\.me)/ =>
        'http://public-api.wordpress.com/oembed/1.0/',

      # NoEmbed
      /(thedailyshow\.com|funnyordie\.com|ted\.com|livejournal\.com|github\.com|metacafe\.com|wikipedia\.org|xkcd\.com|imdb\.com)/ => 'http://noembed.com/embed?nowrap=on'
    }

    # Locate the correct service endpoint for the given resource URL.
    #
    # @param url [String] a fully-qualified URL to an oembeddable resource
    #
    # @return the url, or false if no known endpoint.
    def service_endpoint url
      endpoint = LIST.find do |(pattern, endpoint)|
        url =~ pattern
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
