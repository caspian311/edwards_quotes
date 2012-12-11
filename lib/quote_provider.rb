require "quotes"

class QuoteProvider
   @@all_quotes = []
   def self._init
      if @@all_quotes.empty?
         @@all_quotes = Quotes.load_all
         @@all_quotes.unshift @@all_quotes.pop
         @@all_quotes.push @@all_quotes.shift
      end
   end

   def get_next_quote
      self.class._init
      @@all_quotes.push(quote = @@all_quotes.shift)
      quote
   end
end

