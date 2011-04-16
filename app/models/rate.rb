# == Schema Information
# Schema version: 20110416095434
#
# Table name: rates
#
#  id         :integer(4)      not null, primary key
#  value      :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Rate < ActiveRecord::Base
end
