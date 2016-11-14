class ListingsController < ApplicationController
  def index
    @listings = Property.where(listed: 1)
  end

  def show
    @listing = Listing.find(params[:id])
    @last_bid = @listing.bids.last
  end

  def mylistings
    @current_user_listings = current_user.owned_listings
  end

  #for countdown timer
  def create
    duration = Time.now + 2.minutes
    duration_ms = duration.to_f

    render json: {
      'expiry' => duration_ms
    }
  end

end
