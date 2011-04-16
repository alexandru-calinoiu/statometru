class AddCategoryIndexToCategory < ActiveRecord::Migration
  def self.up
    add_index :categories, :category_id
  end

  def self.down
    remove_index :categories, :category_id
  end
end
