require 'spec_helper'

describe SearchController do
  describe "routing" do
    it "should navigate to index" do
      { :get => "/search" }.should route_to(:controller => "search", :action => "index")
    end
  end
end
