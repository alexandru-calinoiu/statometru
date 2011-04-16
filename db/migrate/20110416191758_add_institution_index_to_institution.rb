class AddInstitutionIndexToInstitution < ActiveRecord::Migration
  def self.up
    add_index :institutions, :institution_id
  end

  def self.down
    remove_index :institutions, :institution_id
  end
end
