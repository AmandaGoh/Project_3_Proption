class BidtestController < ApplicationController
  def show
    @bid = Bid.new
  end

  def create
    # debugger
    puts bid_params
    # @new_bid = current_user.bids.create(bid_params)
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount)
  end

end
