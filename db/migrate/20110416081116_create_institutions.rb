class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.text :address
      t.float :rating
      t.integer :rate_count

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
