class AddTypeToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :location_type, :integer
  end

  def self.down
    remove_column :locations, :location_type
  end
end
