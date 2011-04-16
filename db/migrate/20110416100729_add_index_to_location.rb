class AddIndexToLocation < ActiveRecord::Migration
  def self.up
    add_index :institutions, :location_id
  end

  def self.down
    remove_index :institutions, :location_id
  end
end
