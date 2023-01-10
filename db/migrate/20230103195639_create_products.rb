class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :unit_type
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
