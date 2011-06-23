class RenameRateToRatingInCategory < ActiveRecord::Migration
  def self.up
    rename_column :categories, :rate, :rating
  end

  def self.down
    rename_column :categories, :rating, :rate
  end
end
