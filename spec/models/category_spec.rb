require 'spec_helper'

describe Category do
  describe "rate" do
    it "should calculate rate for a give rating and rate_count" do
      cat = Category.new(:rating => 12.0, :rate_count => 2)
      cat.rate.should == 6
    end

    it "should calculate return 0 for null rate_count" do
      cat = Category.new(:rating => 12.0, :rate_count => nil)
      cat.rate.should == 0
    end
  end
end
