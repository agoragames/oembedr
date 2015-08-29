require File.dirname(__FILE__) + '/../spec_helper'

module Oembedr
  describe ParsedUrl do
    let(:valid_resource_url) { "http://www.youtube.com/watch?v=b9XsTtFu64Y" }
    let(:parser) { ParsedUrl.new(valid_resource_url) }
    let(:trololo_parser) { ParsedUrl.new("http://trolololo.com") }
    let(:complex_url_parser) {
      ParsedUrl.new("https://twitter.com/hypomodern/status/158203918323695616")
    }

    it "includes the Providers module" do
      parser.class.included_modules.should include(Oembedr::Providers)
    end

    describe "#url" do
      it "is set to the results of URI.parse on the appropriate service endpoint" do
        parser.url.should be_a_kind_of(URI::HTTP)
        parser.url.host.should == "www.youtube.com"
        parser.url.path.should == "/oembed"
      end
      it "is set to false if there is no known endpoint" do
        trololo_parser.url.should be_falsey
      end
    end

    describe "#host" do
      it "returns an intelligent hostname (including the scheme) instead of just the domain" do
        parser.host.should == "http://www.youtube.com"
        complex_url_parser.host.should == "https://api.twitter.com"
      end
      it "returns false if there wasn't a valid URL" do
        trololo_parser.host.should be_falsey
      end
    end

    describe "#path" do
      it "returns the path portion of the url" do
        parser.path.should == "/oembed"
      end
      it "returns false if there wasn't a valid URL" do
        trololo_parser.path.should be_falsey
      end
    end

  end
end