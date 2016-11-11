class BidsController < ApplicationController

    def index
    end

    def create
      # debugger


      puts 'bid amount!!!'
      p bid_params[:bid_amount]

      @new_bid = Bid.new

      @new_bid.bid_amount = bid_params[:bid_amount]
      @new_bid.listing_id = params[:listing_id]
      @new_bid.bidder_id = current_user.id

      @new_bid.save

      puts @new_bid.errors.full_messages

    end

    private

    def bid_params
      params.permit(:bid_amount)
    end
end
