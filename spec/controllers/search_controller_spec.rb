require 'spec_helper'

describe SearchController do
  render_views

  describe "GET 'index'" do
    before :each do
      @institution = Factory(:institution)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should contain a warning if not search term" do
      get 'index'
      response.should have_selector("div", :content => "Trebuie sa introduci cel putin un cuvant")
    end

    it 'should contain results for a search term' do
      get 'index', :search => { :search_term => @institution.name }
      response.should have_selector("p", :content => @institution.name)
    end
  end
end
