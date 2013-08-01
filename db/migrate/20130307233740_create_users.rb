class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.string :birthdate, :null => false
      t.string :password_hash, :null => false
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end


# However, Active Record seems to be expecting mm/dd/yy.

# If I enter 01/03/2010, this gets put in as 03 January 2010.

