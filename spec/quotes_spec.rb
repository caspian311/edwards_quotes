require "spec_helper"

describe Quotes do
   describe "#load_all" do
      before(:all) do
         File.open("/tmp/quotes.txt", "w") do |f|
            f.write """
this is the first quote
this is the second quote
this is the third quote
            """
         end
      end

      after(:all) do
         File.delete("/tmp/quotes.txt")
      end

      it "return all quotes from given file" do
         Quotes.set_file "/tmp/quotes.txt"
         all_quotes = Quotes.load_all

         all_quotes.count.should be 3
         all_quotes[0].should eq "this is the first quote"
         all_quotes[1].should eq "this is the second quote"
         all_quotes[2].should eq "this is the third quote"
      end
   end
end
