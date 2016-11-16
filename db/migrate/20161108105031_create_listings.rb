class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.timestamp :auction_date
      t.timestamp :duration
      t.integer :property_id

      t.timestamps
    end
  end
end
