require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Dir["./lib/*.rb"].each do |file|
   require file
end

task :run do
   Main.new.run
end


task :default => :run
