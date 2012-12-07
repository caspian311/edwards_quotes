require "spec_helper"

describe QuoteProvider do
   test_object = QuoteProvider.new()

   describe "#get_random_quote" do
      it "should provide a sampled quote" do
         quote = mock("expected quote")
         all_quotes = mock("all quotes")

         Quotes.should_receive(:load_all).times.and_return(all_quotes)
         all_quotes.should_receive(:sample).times.and_return(quote)

         test_object.get_random_quote.should be quote
      end
   end
end
