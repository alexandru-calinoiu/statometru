# == Schema Information
# Schema version: 20110623162534
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer(4)
#  rating      :float           default(0.0)
#  rate_count  :integer(4)      default(0)
#

class Category < ActiveRecord::Base
  attr_accessible :name, :rating, :rate_count

  belongs_to :category, :foreign_key => :category_id
  has_many :categories, :foreign_key => :category_id

  def rate
    if (rate_count.nil? || rate_count == 0)
      result = 0
    else
      result = (rating / rate_count).round
    end

    result
  end
end
