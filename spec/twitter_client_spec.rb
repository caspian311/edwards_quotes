require "spec_helper"
require "twitter"

describe TwitterClient do
   describe "#update" do
      it "should post to twitter" do
         text = "this is my update"
         Twitter.should_receive(:update).with(text)

         test_object = TwitterClient.new

         test_object.update text
      end
   end
end
