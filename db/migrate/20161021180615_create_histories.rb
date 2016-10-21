class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :amount
      t.references :user, index: true
      t.references :lender, index: true

      t.timestamps
    end
  end
end
