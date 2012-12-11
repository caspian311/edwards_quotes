require "spec_helper"

describe Poster do
   describe "#post" do
      it "loops through quotes" do
         mock_quote_provider = mock("quote provider")
         mock_twitter_client = mock("twitter client")
         test_object = Poster.new(mock_quote_provider, mock_twitter_client)

         random_quote = mock("random quote")
         mock_quote_provider.stub(:get_next_quote).and_return(random_quote)

         mock_twitter_client.should_receive(:update).with(random_quote)

         test_object.post
      end
   end
end
