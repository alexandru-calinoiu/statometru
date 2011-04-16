class SearchController < ApplicationController
  def index
    @institutions = Institution.paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end

  def find
    @institutions = Institution.find_all_by_name(params[:search_term]).paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
end
