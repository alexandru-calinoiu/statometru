class InstitutionsController < ApplicationController

  def details
    @institution = Institution.find(params[:id]) rescue nil
    if @institution.blank?
      flash[:notice] = "Wrong institution"
      redirect_to "/"
    end

    @current_rate = Rate.where(:user_id => current_user.id, :institution_id => @institution.id).first rescue nil
    store_location
  end

  def rate
    institution = Institution.find(params[:id]) rescue nil
    if institution.blank?
      flash[:notice] = "Nu exista institutia"
      redirect_to "/"
    end

    nota = params[:nota].to_i
    if nota.blank? or nota < 1 or nota > 10
      flash[:notice] = "Nota gresita"
      redirect_to "/"
    end

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

    @institutions = Institution.includes(:location).search(@query, :page => params[:page], :per_page => 10, :match_mode => :extended)

    respond_to do |format|
      format.js { render :layout => false }
      format.html { render }
    end
  end

end
