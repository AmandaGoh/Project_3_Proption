class BidsController < ApplicationController

  def index
      @current_user_bids = current_user.bids

      respond_to do |format|
          format.html
          format.json { render json: @current_user_bids }
      end
  end


  def history
      @bid_info_for_listing = Bid.where(["listing_id = ?", params[:listing_id]])

      respond_to do |format|
          format.html
          format.json { render json: @bid_info_for_listing }
      end
  end


  def create
      listing = Listing.find(params[:id])
      @new_bid = Bid.new

      if listing.bids.exists?

        if bid_params[:bid_amount].to_i > listing.bids.last.bid_amount
          @new_bid.bid_amount = bid_params[:bid_amount]
          @new_bid.listing_id = params[:id]
          @new_bid.bidder_id = current_user.id

          if @new_bid.save
            # flash[:message] = "Bid Successful!"
            ActionCable.server.broadcast 'bid_details',
            bid: @new_bid.bid_amount,
            user: current_user.username
          end
          render json: {
            'message' => 'Bid Successful!',
            'status' => 'successful'
          }
          puts 'errors here!!!'
          puts @new_bid.errors.full_messages
        else
          render json: {
            'message' => "Please place a bid amount higher than " + listing.bids.last.bid_amount.to_s,
            'status' => 'fail'
          }
        end

      else

        reserve_price = listing.property.reserve_price

        if bid_params[:bid_amount].to_i > reserve_price
            @new_bid.bid_amount = bid_params[:bid_amount]
            @new_bid.listing_id = params[:id]
            @new_bid.bidder_id = current_user.id

            if @new_bid.save
              # flash[:message] = "Bid Successful!"
              ActionCable.server.broadcast 'bid_details',
              bid: @new_bid.bid_amount,
              user: current_user.username
            end
            render json: {
              'message' => 'Bid Successful!',
              'status' => 'successful'
            }
        else
          render json: {
            'message' => "Please place a bid amount higher than " + listing.property.reserve_price.to_s,
            'status' => 'fail'
          }
        end

      end

  end


  private

  def bid_params
      params.permit(:bid_amount)
  end

end
