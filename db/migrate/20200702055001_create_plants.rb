class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.integer :account_id
      t.string :name
      t.float :price
      t.string :kind
      t.string :description
      t.datetime :date

      t.timestamps
    end
  end
end
