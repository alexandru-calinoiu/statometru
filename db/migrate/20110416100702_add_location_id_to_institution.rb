class AddLocationIdToInstitution < ActiveRecord::Migration
  def self.up
    add_column :institutions, :location_id, :integer
  end

  def self.down
    remove_column :institutions, :location_id
  end
end
