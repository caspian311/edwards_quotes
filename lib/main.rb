require "poster"

module Quoter
   class Main
      DEFAULT_TIME_INTERVAL = 1
#DEFAULT_TIME_INTERVAL = 24 * 60 * 60
      
      def initialize(poster=Poster.new, time_interval=DEFAULT_TIME_INTERVAL)
         @poster = poster
         @time_interval = time_interval
         @still_running = true
      end

      def run
         Quoter::log.info "starting up..."
         $DEBUG = true
         @thread = Thread.new do
            while @still_running do
               _safely_quote
               sleep @time_interval
            end
         end
      end

      def _safely_quote
         begin
            Quoter::log.info "posting"
            @poster.post
         rescue
            Quoter::log.error "Error: #{$!}"
         end
      end

      def wait_for_it
         @thread.join
      end

      def stop
         @still_running = false
         @thread.join
      end
   end
end
