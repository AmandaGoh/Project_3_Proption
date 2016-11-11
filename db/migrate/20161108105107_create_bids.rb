class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :bid_amount
      t.integer :bidder_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
