class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :image
      t.decimal :price, null: false
      t.string :currency, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
