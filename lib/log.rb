require "logger"

module Quoter
   class MultiIO
      def initialize(*targets)
         @targets = targets
      end

      def write(*args)
         @targets.each {|t| t.write(*args)}
      end

      def close
         @targets.each(&:close)
      end
   end


   log_file = File.open("output.log", "a")
   @logger = Logger.new MultiIO.new(STDOUT, log_file)
   @logger.level = Logger::DEBUG

   original_formatter = Logger::Formatter.new
   @logger.formatter = proc do |severity, datetime, progname, msg|
        original_formatter.call(severity, datetime, progname, msg.dump)
   end


   def self.log
      @logger
   end
end
