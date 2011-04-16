require 'spec_helper'

describe Institution do

  describe "institutions associations" do
    before :each do
      @institution = Factory(:institution)
    end

    it "should have a category attribute" do
      @institution.should respond_to(:category)
    end

    it "should have a location attribute" do
      @institution.should respond_to(:location)
    end
  end
end
