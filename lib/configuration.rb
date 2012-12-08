require "twitter"

Twitter.configure do |conf|
   conf.consumer_key = _read_file "conf/consumer_key.txt"
   conf.consumer_secret = _read_file "conf/consumer_secret.txt"
   conf.oauth_token = _read_file "conf/oauth_token"
   conf.oauth_token_secret = _read_file "conf/oauth_token_secret"
end

def _read_file(filename)
   contents = ""
   File.open(filename, "r") do |file|
      contents = file.read
   end
   return contents
end
