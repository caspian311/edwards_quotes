
class Import
   def self.grab_tweets
      content = ""
      Twitter.user_timeline("JonEdwardsDaily").each do |tweet|
         content += (tweet.text + "\n")
      end

      File.open("quotes.txt", "w") do |f|
         f.puts content
      end
   end
end
