require "quote_provider"
require "twitter_client"

class Poster
   def initialize(quote_provider=QuoteProvider.new, twitter_client=TwitterClient.new)
      @quote_provider = quote_provider
      @twitter_client = twitter_client
   end

   def post
      @twitter_client.update @quote_provider.get_next_quote
   end
end
