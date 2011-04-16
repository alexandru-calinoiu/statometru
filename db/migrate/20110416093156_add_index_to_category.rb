class AddIndexToCategory < ActiveRecord::Migration
  def self.up
    add_index :institutions, :category_id
  end

  def self.down
    remove_index :institutions, :category_id
  end
end
