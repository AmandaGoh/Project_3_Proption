class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :prop_type
      t.string :address
      t.integer :postal_code
      t.string :Tenure
      t.integer :size
      t.text :description

      t.timestamps
    end
  end
end
