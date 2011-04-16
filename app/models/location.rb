# == Schema Information
# Schema version: 20110416100729
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  type       :integer(4)
#

class Location < ActiveRecord::Base
  attr_accessible :name, :type
end
