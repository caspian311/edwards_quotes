require "quotes"

class QuoteProvider
   def get_random_quote
      Quotes.load_all.sample
   end
end

