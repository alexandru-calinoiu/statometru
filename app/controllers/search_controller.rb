class SearchController < ApplicationController

  def index
    if !params[:search].nil?
      @institutions = Institution.search("#{params[:search][:search_term]}*").paginate(:page => params[:page], :per_page => 10)
    end

    respond_to do |format|
      format.html
    end
  end
end
