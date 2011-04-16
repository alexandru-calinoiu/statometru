class InstitutionsController < ApplicationController

  before_filter :authenticate_user!, :only => [:rate]

  def index
    @institutions = Institution.paginate(:page => params[:page], :per_page => 16)

    respond_to do |format|
      format.html
    end
  end

  def details
    @institution = Institution.find(params[:id])
    @current_rate = Rate.where(:user_id => current_user.id, :institution_id => @institution.id).first rescue nil
  end

  def create
  end

  def update
  end

  def delete
  end

  def rate
    institution = Institution.find(params[:id])
    nota = params[:nota].to_i

    current_rate = Rate.where(:user_id => current_user.id, :institution_id => institution.id).first
    if current_rate.blank?
      Rate.create!(:institution_id => institution.id, :user_id => current_user.id, :value => nota)
    else
      current_rate.value = nota
      current_rate.save!
    end

    redirect_to "/institutie/#{institution.id}"
  end

  def find
    if !params[:search_term].blank?
      @search_terms = params[:search_term].split
      @query = "@name *#{@search_terms.join("* *")}*"
    end

    if !params[:search_location].blank?
      @search_location = params[:search_location].split
      @query = "#{@query} @location_name *#{@search_location.join("* *")}*"
    end

    @institutions = Institution.search(@query, :page => params[:page], :per_page => 10, :match_mode => :extended)

    respond_to do |format|
      format.html { render :action => 'index' }
    end
  end
end
