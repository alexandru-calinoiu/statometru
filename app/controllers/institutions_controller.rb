class InstitutionsController < ApplicationController

before_filter :authenticate_user!, :only => [:rate]

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

end
