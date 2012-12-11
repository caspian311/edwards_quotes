
class Quotes
   def self.set_file(filename)
      @@filename = filename
   end

   def self.load_all
      @@filename ||= "quotes.txt"

      quotes = []
      File.open(@@filename, "r") do |f|
         f.readlines.each do |line|
            line.strip!
            if line != ""
               quotes << line
            end
         end
      end

      return quotes
   end
end
