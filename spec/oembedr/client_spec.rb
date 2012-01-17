require File.dirname(__FILE__) + '/../spec_helper'

module Oembedr
  describe Client do
    let(:valid_resource_url) { "http://www.youtube.com/watch?v=b9XsTtFu64Y" }
    let(:client) { Client.new(valid_resource_url) }

    describe "initialization" do
      it "requires a resource url as a parameter" do
        lambda { Client.new }.should raise_error(ArgumentError)
      end
      it "cracks the url into a ParsedUrl object" do
        client.parsed_url.should be_a_kind_of(ParsedUrl)
      end
    end

    describe "#connection" do
      it "returns a Faraday::Connection object" do
        client.connection.should be_a_kind_of(Faraday::Connection)
      end
      it "sets some basic attributes on the connection" do
        conn = client.connection
        conn.headers.should == {
          "Accept" => "application/json",
          "User-Agent" => "Oembedr Gem #{Oembedr::VERSION}"
        }
        conn.host.should == "www.youtube.com"
      end
    end

    use_vcr_cassette "client", :record => :new_episodes

    describe "#get" do
      it "requests data and parses that JSON" do
        response = client.get
        response.body["type"].should == "video"
        response.body["html"].should_not be_empty
      end
      it "raises an appropriate error if there is a problem" do
        client = Client.new("http://www.youtube.com/foobar?qq=12314332")
        lambda { client.get }.should raise_error(Faraday::Error::ResourceNotFound)
      end
      it "passes through any additional parameters (e.g. size constraints)" do
        client = Client.new("http://www.youtube.com/watch?v=Qi_AAqi0RZM")
        response = client.get({:params => { :maxwidth => "150", :maxheight => "100" }})
        response.body["width"].should <= 150
        response.body["height"].should <= 100
      end
    end

  end
end