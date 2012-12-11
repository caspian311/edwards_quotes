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
         Quoter::log.info "starting up"
         @thread = Thread.new do
            begin
               Quoter::log.info "starting thread"
               while @still_running do
                  Quoter::log.info "posting..."
                  @poster.post
                  Quoter::log.info "waiting..."
                  sleep @time_interval
               end
            rescue
               Quoter::log.error "Error: #{$!}"
            end
         end

         Quoter::log.info "done"
      end

      def stop
         @still_running = false
         @thread.join
      end
   end
end
