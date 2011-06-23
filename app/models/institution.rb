# == Schema Information
# Schema version: 20110623162534
#
# Table name: institutions
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  address        :text
#  rating         :float           default(0.0)
#  rate_count     :integer(4)      default(0)
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer(4)
#  location_id    :integer(4)
#  institution_id :integer(4)
#

class Institution < ActiveRecord::Base
  attr_accessible :name, :address, :rating, :rate_count, :location, :category

  belongs_to :category
  belongs_to :location

  def application()
    #code here
  end

  define_index do
    indexes name, :sortable => true
  end

  def rate
    if (rate_count.nil? || rate_count == 0)
      result = 0
    else
      result = (rating / rate_count).round
    end

    result
  end
end
