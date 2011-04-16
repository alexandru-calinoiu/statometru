class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.text :address
      t.float :rating, :default => 0
      t.integer :rate_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
