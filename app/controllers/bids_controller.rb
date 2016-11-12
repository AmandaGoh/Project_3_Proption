class BidsController < ApplicationController

    def index
      @last_bid = Bid.last
    end

    def create
      # debugger

      @new_bid = Bid.new

      @new_bid.bid_amount = bid_params[:bid_amount]
      @new_bid.listing_id = params[:listing_id]
      @new_bid.bidder_id = current_user.id

      if @new_bid.save
        ActionCable.server.broadcast 'bid_details',
          bid: @new_bid.bid_amount,
          user: current_user.username
        head :ok
      end

      puts @new_bid.errors.full_messages
    end

    private

    def bid_params
      params.permit(:bid_amount)
    end
end
