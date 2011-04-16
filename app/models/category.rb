# == Schema Information
# Schema version: 20110416133627
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer(4)
#

class Category < ActiveRecord::Base
  attr_accessible :name, :rate

  belongs_to :category, :foreign_key => :category_id
  has_many :categories, :foreign_key => :category_id
end