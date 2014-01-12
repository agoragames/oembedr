require File.dirname(__FILE__) + '/spec_helper'

describe Oembedr do
  let(:test_url) { "http://www.youtube.com/watch?v=b9XsTtFu64Y" }
  let(:mock_client) { double(Oembedr::Client, :ready? => true) }

  describe "#fetch" do
    it "leverages the Client class to retrieve an oembeddable resource from the given url" do
      Oembedr::Client.stub(:new).and_return(mock_client)
      mock_client.should_receive(:get).with({})
      Oembedr.fetch test_url
    end
    it "passes any options through correctly" do
      Oembedr::Client.stub(:new).and_return(mock_client)
      mock_client.should_receive(:get).with({ :maxwidth => 350 })
      Oembedr.fetch test_url, { :maxwidth => 350 }
    end
    it "returns false if there is no known service for the given URI" do
      Oembedr.fetch("http://jasdfasdfas.com").should be_false
    end
  end

end