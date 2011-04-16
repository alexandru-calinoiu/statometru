class SearchController < ApplicationController

  def index
    @institutions = Institution.paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end

  def find
    @institutions = Institution.search("*#{params[:search_term].split.join("* *")}*", :page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
end
