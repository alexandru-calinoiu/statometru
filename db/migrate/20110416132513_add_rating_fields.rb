class AddRatingFields < ActiveRecord::Migration
  def self.up
    add_column :rates, :institution_id, :integer
    add_column :rates, :user_id, :integer
  end

  def self.down
    remove_column :rates, :institution_id
    remove_column :rates, :user_id
  end
end
