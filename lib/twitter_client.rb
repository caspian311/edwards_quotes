require "twitter"

class TwitterClient
   def update(text)
      Twitter.update text
   end
end
