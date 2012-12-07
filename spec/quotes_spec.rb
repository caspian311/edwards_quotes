require "spec_helper"

describe Quotes do
   describe "#load_all" do
      it "return all quotes" do
         Quotes.load_all.count.should be > 1
      end
   end
end
