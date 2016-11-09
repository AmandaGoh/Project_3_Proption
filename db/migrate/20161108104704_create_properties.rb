class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :prop_type
      t.string :address
      t.integer :postal_code
      t.integer :reserve_price
      t.string :tenure
      t.integer :size
      t.text :description
      t.string :picture
      t.integer :seller_id

      t.timestamps
    end
  end
end
