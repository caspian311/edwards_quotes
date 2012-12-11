require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Dir["./lib/*.rb"].each do |file|
   require file
end

task :import do
   Import.grab_tweets
end

task :run do
   Quoter::Main.new.run
end

task :default => :run

task :log_test do
   Quoter::log.info "info message"
   Quoter::log.warn "warn message"
   Quoter::log.error "error message"
   Quoter::log.fatal "fatal message"
end
