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
    if !params[:institution].blank?
      @search_institution = params[:institution].split
      @query = "@name *#{@search_institution.join("* *")}*"
    end

    if !params[:location].blank?
      @search_location = params[:location].split
      @query = "#{@query} @location_name *#{@search_location.join("* *")}*"
    end

    @institutions = Institution.search(@query, :page => params[:page], :per_page => 10, :match_mode => :extended)

    respond_to do |format|
      format.html { render :action => 'index', :layout => false }
    end
  end
end
