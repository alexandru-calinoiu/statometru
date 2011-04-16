require 'spec_helper'

describe SearchController do
  render_views

  describe "GET 'index'" do
    before :each do
      Factory(:institution)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have a search term input" do
      get 'index'
      response.should have_selector("input", :id => 'search_term')
    end
  end
end
