class AddCategoryIdToInstitution < ActiveRecord::Migration
  def self.up
    add_column :institutions, :category_id, :integer
  end

  def self.down
    remove_column :institutions, :category_id
  end
end
