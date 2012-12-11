require "spec_helper"

describe QuoteProvider do

   describe "#get_random_quote" do
      it "should provide a sampled quote" do
         quote1 = mock("quote 1")
         quote2 = mock("quote 2")
         quote3 = mock("quote 3")
         Quotes.should_receive(:load_all).and_return([quote1, quote2, quote3])

         test_object = QuoteProvider.new
         test_object.get_next_quote.should be quote1
         test_object.get_next_quote.should be quote2
         QuoteProvider.new.get_next_quote.should be quote3
         QuoteProvider.new.get_next_quote.should be quote1
      end
   end
end
