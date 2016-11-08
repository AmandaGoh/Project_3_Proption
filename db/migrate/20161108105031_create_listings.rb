class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.date :auction_date
      t.time :duration
      t.integer :property_id
      t.integer :bid_id

      t.timestamps
    end
  end
end
