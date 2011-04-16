class AddInstitutionIdToInstitution < ActiveRecord::Migration
  def self.up
    add_column :institutions, :institution_id, :integer
  end

  def self.down
    remove_column :institutions, :institution_id
  end
end
