class DirectoriesController < ApplicationController
  def index
    @categories = Category.find_all_by_category_id(0)

    respond_to do |format|
      format.html
    end
  end

  def show
    @categories = Category.find(params[:id]).categories
    @institutions = Institution.find_all_by_category_id(params[:id]).paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end
end
