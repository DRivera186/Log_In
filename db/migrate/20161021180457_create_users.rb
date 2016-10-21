class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :money
      t.string :purpose
      t.text :description
      t.integer :raised

      t.timestamps
    end
  end
end
