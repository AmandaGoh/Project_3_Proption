class BidsController < ApplicationController
  def index
    @bids = current_user.bids

    # current_user.bids.listing.property


    respond_to do |format|
      format.html
      format.json { render json: @bids }
    end
  end

  def new
  end
end
