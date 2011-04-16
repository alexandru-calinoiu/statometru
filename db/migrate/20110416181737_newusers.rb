class Newusers < ActiveRecord::Migration
  def self.up
    drop_table :users

    create_table :users do |t|
      t.string :identifier
      t.string :username
      t.string :email

      t.timestamps
    end
    add_index :users, :identifier
  end

  def self.down
    drop_table :users
  end
end
