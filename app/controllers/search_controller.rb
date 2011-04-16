class SearchController < ApplicationController

  def index
    @institutions = Institution.paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end

  def find
    @search_terms = params[:search_term].split
    @institutions = Institution.search("*#{@search_terms.join("* *")}*", :page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
end
