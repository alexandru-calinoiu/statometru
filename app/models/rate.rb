# == Schema Information
# Schema version: 20110416133627
#
# Table name: rates
#
#  id             :integer(4)      not null, primary key
#  value          :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  institution_id :integer(4)
#  user_id        :integer(4)
#

class Rate < ActiveRecord::Base
end
