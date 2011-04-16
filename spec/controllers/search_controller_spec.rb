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

  describe "get 'find'" do
    before :each do
      @institution = Factory(:institution)
    end

    it "for a name will return that institution" do
      get 'find', :search_term => @institution.name
      response.should have_selector("p", :content => @institution.name)
    end
  end
end
