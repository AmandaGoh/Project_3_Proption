class BidsController < ApplicationController
  def index
    @current_user_bids = current_user.bids

    respond_to do |format|
      format.html
      format.json { render json: @bids }
    end
  end



  def last_bid_price
    logger.debug "The listing_id is #{params[:listing_id]}"
    checking_id = params[:listing_id].to_i
    logger.debug "yyyyyyy #{checking_id}"


    @bid_price = Bid.last(:conditions => ["listing_id = ?", params[:listing_id].to_i])
    # @bid_price = Bid.last(:conditions => ["listing_id = ?", checking_id])

    # Bid.last.bid_amount(:conditions => "listing_id = 4")

    logger.debug "xxxxxx #{@bid_price}"

  end


      # def new
      #   #check if new bid is greater than the last bid
      #
      #   if Bid.last.bid_amount < params[:bid][:bid_amount]
      #
      #       @new_bid = Bid.new()
      #       @new_bid.bid_amount = params[:bid][:bid_amount]
      #       @new_bid.bidder_id = params[:bid][:bidder_id]
      #       @new_bid.listing_id = params[:bid][:listing_id]
      #       @new_bid.save
      #       flash[:notice] = "Bid submitted successfully"
      #
      #   else
      #       flash[:alert] = "Unsuccessful bid, pls check and resubmit. Bid amount must be higher than last bid amount."
      #   end
      # end

end
