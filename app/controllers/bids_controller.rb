class BidsController < ApplicationController
  def index
    @current_user_bids = current_user.bids
    # current_user.bids.listing.property

    respond_to do |format|
      format.html
      format.json { render json: @bids }
    end
  end


  def new
    @new_bid = Bid.new()
    @new_bid.bid_amount = params[:bid][:bid_amount]
    @new_bid.user_id = params[:bid][:user_id]
    @new_bid.listing_id = params[:bid][:listing_id]
    @new_bid.save

    # display message to say bid successfully saved???
  end

end
