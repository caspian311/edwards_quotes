require "poster"

class Main
   def initialize(poster=Poster.new, time_interval=1.day)
      @poster = poster
      @time_interval = time_interval
      @still_running = true
   end

   def run
      @t = Thread.new do
         while @still_running do
            @poster.post
            sleep @time_interval
         end
      end
   end

   def stop
      @still_running = false
      @t.join
   end
end
