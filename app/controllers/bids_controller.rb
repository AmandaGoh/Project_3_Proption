class BidsController < ApplicationController

    def index
      @last_bid = Bid.last
    end

    def create
      @new_bid = Bid.new

      if bid_params[:bid_amount].to_i > Bid.last.bid_amount
          @new_bid.bid_amount = bid_params[:bid_amount]
          @new_bid.listing_id = params[:id]
          @new_bid.bidder_id = current_user.id

          if @new_bid.save
          # flash[:message] = "Bid Successful!"
            ActionCable.server.broadcast 'bid_details',
              bid: @new_bid.bid_amount,
              user: current_user.username
            head :ok
          end
      else
        flash[:message] = "Please place a bid amount higher than " + Bid.last.bid_amount.to_s
      end
      redirect_to listing_path
      puts @new_bid.errors.full_messages
    end

    private

    def bid_params
      params.permit(:bid_amount)
    end

end
