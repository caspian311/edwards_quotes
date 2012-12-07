require "spec_helper"

describe Main do
   describe "#run" do
      it "should post every time interval" do
         mock_poster = mock("poster")
         time_interval = 0.1

         test_object = Main.new(mock_poster, time_interval)

         mock_poster.should_receive(:post).at_least(:twice).at_most(5).times
   
         test_object.run

         sleep 0.3

         test_object.stop
      end
   end
end

