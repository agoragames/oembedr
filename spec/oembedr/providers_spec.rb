require File.dirname(__FILE__) + '/../spec_helper'

module Oembedr
  describe Providers do

    describe "#service_endpoint" do
      let(:test_url) { 'http://www.youtube.com/watch?v=b9XsTtFu64Y' }

      subject do
        Oembedr.service_endpoint(test_url)
      end

      it { should_not be_empty }

      context 'with an invalid url' do
        let(:test_url) { 'http://www.madeupdomainthatwedontsupportyet.com/foos/324' }

        it { should be_false }
      end
    end

    describe "#known_service?" do
      let(:test_url) {}

      subject { Oembedr.known_service?(test_url).should be_true }

      %w(
        http://www.youtube.com/watch?v=b9XsTtFu64Y
        http://youtu.be/b9XsTtFu64Y
        http://www.flickr.com/photos/puzzlemaster/6693154925/in/photostream
        http://www.flic.kr/6693154925
        http://www.viddler.com/v/a802f490
        http://qik.com/video/15944
        http://revision3.com/tbhs/holidaycontroller
        http://www.hulu.com/watch/319756/the-daily-show-with-jon-stewart-mon-jan-16-2012
        http://vimeo.com/35055590
        http://instagr.am/p/BUG/
        http://www.slideshare.net/alwynlau/martin-luther-king-jr-quote-presentation
        http://tv.majorleaguegaming.com/videos/80344-the-year-in-starcraft-2
        http://yfrog.com/hsyu9ymj
        http://blip.tv/cablekooks/fox-news-anchor-john-stossel-wants-people-to-stop-voting-5883656
        http://skitch.com/hannaolsen/rq33h/vday
        http://www.twitch.tv/esltv_lol/c/2637023
        https://twitter.com/hypomodern/status/158203918323695616
        http://www.dailymotion.com/video/x5ioet_phoenix-mars-lander_tech
        http://www.scribd.com/doc/17896323/Indian-Automobile-industryPEST
        http://dotsub.com/view/10e3cb5e-96c7-4cfb-bcea-8ab11e04e090
        http://www.clikthrough.com/theater/video/55
        http://www.kinomap.com/kms-vzkpc7
        http://img.photobucket.com/albums/v211/JAV123/Michael%20Holland%20Candle%20Burning/_MG_5661.jpg
        https://speakerdeck.com/u/czarneckid/p/railsconf-2012-stack-smashing-cornflower-blue
        http://soundcloud.com/cape910/17-cape-x-example-midnight-run
        http://www.ustream.tv/recorded/36626129
        http://www.nfb.ca/film/judoka?hpen=feature_1
        http://bambuser.com/v/2279611
        http://www.justin.tv/wagntail/b/438417161
        http://wordpress.tv/2013/07/29/matt-mullenweg-state-of-the-word-2013/
        http://www.collegehumor.com/video/6905412/how-hollywood-ruins-relationships-with-kristen-connolly
        http://open.spotify.com/track/07FjCnZHF4XpHyMMFS20rl
        http://en.wikipedia.org/wiki/Perl_6_rules#Grammars
        https://gist.github.com/leedo/796300
        https://github.com/leedo/noembed/commit/87fc1b3a439d9ccd724b331e32223cad289eb6a1
        https://speakerdeck.com/stas/on-saltstack-configuration-management-and-remote-execution
        http://polldaddy.com/poll/7012505/
        https://gmep.org/media/14684
        https://cacoo.com/diagrams/pByowlpiZ7YTV7UN
        http://www.dailymile.com/people/delsolman1/entries/24232560
        http://www.dipity.com/tatercakes/Internet_Memes/
        http://sketchfab.com/show/ddf560de3fd34a019a201937219298ff
        http://www.ifixit.com/Guide/Installing+MacBook+Pro+13-Inch+Unibody+Mid+2009+Display/1342/1
        http://techcrunch.com/2013/07/31/sign-up-for-the-berlin-pitch-off-now/
      ).each_with_index do |url, ind|
        context "for #{url}, tests: #{ind}/#{Oembedr::Providers::LIST.count}" do
          let(:test_url) { url }

          it { should be_true }
        end
      end
    end

  end
end
