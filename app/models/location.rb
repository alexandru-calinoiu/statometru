# == Schema Information
# Schema version: 20110416133627
#
# Table name: locations
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  location_type :integer(4)
#  location_id   :integer(4)
#

class Location < ActiveRecord::Base
  attr_accessible :name, :location_type
  has_many :institutions

  define_index do
    indexes name, :sortable => true
  end
end
