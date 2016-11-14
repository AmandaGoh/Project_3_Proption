class BidsController < ApplicationController
  def index
      @current_user_bids = current_user.bids




      current_user_bid_listings = current_user.bid_listings


      current_user_bid_listings.each do |user_bid_listing|
          last_bid_price_for_bid_listings = Bid.where(["listing_id = ?", user_bid_listing.id]).last.bid_amount
      end





      respond_to do |format|
          format.html
          format.json { render json: @current_user_bids }
      end
  end


  def history
    @bid_info_for_listing = Bid.where(["listing_id = ?", params[:listing_id]])
  end





  def last_bid_price
    logger.debug "listing_id is #{params[:listing_id]}"

    @bid_price = Bid.where(["listing_id = ?", params[:listing_id]]).last.bid_amount

    logger.debug "Highest bid price for the listing is #{@bid_price}"

    render json: {
      'result': @bid_price
    }

  end



end
