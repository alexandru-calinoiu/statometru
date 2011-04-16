class SearchController < ApplicationController

  def index
    @institutions = Institution.paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end

  def find
    if params[:search_term].blank?
      @search_terms = params[:search_term].split
      @query = "@name #{@search_terms.join("* *")}"
    end

    if !params[:search_location].blank?
      @search_location = params[:search_location].split
      @query = "#{@query} @location_name #{@search_location.join("* *")}"
    end

    @institutions = Institution.search(@query, :page => params[:page], :per_page => 10, :match_mode => :extended)

    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
end
