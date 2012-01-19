require File.dirname(__FILE__) + '/../spec_helper'

module Oembedr
  describe Providers do

    describe "#service_endpoint" do
      it "matches the given URL to a known endpoint" do
        endpoint = Oembedr.service_endpoint("http://www.youtube.com/watch?v=b9XsTtFu64Y")
        endpoint.should_not be_false
      end
      it "returns false if there is no known endpoint" do
        Oembedr.service_endpoint("http://www.madeupdomainthatwedontsupportyet.com/foos/324").should be_false
      end
    end

    describe "#known_service?" do
      it "should return a boolean yes or no if we can handle the given url" do
        Oembedr.known_service?("http://www.youtube.com/watch?v=b9XsTtFu64Y").should be_true
        Oembedr.known_service?("http://www.noserviceherenosir.com/foos/324").should be_false
      end
    end

    context "testing ALL THE THINGS" do
      {
        "http://www.youtube.com/watch?v=b9XsTtFu64Y" => "http://www.youtube.com/oembed",
        "http://www.flickr.com/photos/puzzlemaster/6693154925/in/photostream" => "http://www.flickr.com/services/oembed/",
        "http://www.viddler.com/v/a802f490" => "http://lab.viddler.com/services/oembed/",
        "http://qik.com/video/15944" => "http://qik.com/api/oembed.{format}",
        "http://revision3.com/tbhs/holidaycontroller" => "http://revision3.com/api/oembed/",
        "http://www.hulu.com/watch/319756/the-daily-show-with-jon-stewart-mon-jan-16-2012" => "http://www.hulu.com/api/oembed.{format}",
        "http://vimeo.com/35055590" => "http://www.vimeo.com/api/oembed.{format}",
        "http://instagr.am/p/BUG/" => "http://api.instagram.com/oembed",
        "http://www.slideshare.net/alwynlau/martin-luther-king-jr-quote-presentation" => "http://www.slideshare.net/api/oembed/2",
        "http://tv.majorleaguegaming.com/videos/80344-the-year-in-starcraft-2" => "http://tv.majorleaguegaming.com/oembed",
        "http://yfrog.com/hsyu9ymj" => "http://www.yfrog.com/api/oembed",
        "http://blip.tv/cablekooks/fox-news-anchor-john-stossel-wants-people-to-stop-voting-5883656" => "http://blip.tv/oembed/",
        "http://opera.com" => 'http://my.opera.com/service/oembed',
        "http://skitch.com/hannaolsen/rq33h/vday" => 'http://skitch.com/oembed',
        "http://www.twitch.tv/i_like_turtlez" => false, # OMG! Support OEmbed!
        "https://twitter.com/hypomodern/status/158203918323695616" => 'https://api.twitter.com/1/statuses/oembed.{format}',
        "http://www.dailymotion.com/video/x5ioet_phoenix-mars-lander_tech" => 'http://www.dailymotion.com/api/oembed/',
        "http://www.scribd.com/doc/17896323/Indian-Automobile-industryPEST" => 'http://www.scribd.com/services/oembed',
        "http://dotsub.com/view/10e3cb5e-96c7-4cfb-bcea-8ab11e04e090" => 'http://dotsub.com/services/oembed',
        "http://www.clikthrough.com/theater/video/55" => 'http://clikthrough.com/services/oembed',
        "http://www.kinomap.com/kms-vzkpc7" => 'http://www.kinomap.com/oembed',
        "http://img.photobucket.com/albums/v211/JAV123/Michael%20Holland%20Candle%20Burning/_MG_5661.jpg" => 'http://photobucket.com/oembed'
      }.each do |(test_url, expected_value)|
        it "should match #{test_url} to #{expected_value}" do
          Oembedr.service_endpoint(test_url).should == expected_value
        end

      end
    end

  end
end