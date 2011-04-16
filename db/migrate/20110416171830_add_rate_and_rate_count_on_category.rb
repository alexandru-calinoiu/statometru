class AddRateAndRateCountOnCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :rate, :integer, :default => 0
    add_column :categories, :rate_count, :integer, :default => 0
  end

  def self.down
    remove_column :categories, :rate, :integer
    remove_column :categories, :rate_count
  end
end
