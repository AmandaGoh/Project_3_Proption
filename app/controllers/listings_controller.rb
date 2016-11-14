class ListingsController < ApplicationController
  def index

    @listings = Listing.all
    @all_listings = Property.listed

  end

  def show
    @listing = Listing.find(params[:id])
  end

  def mylistings
    @current_user_listings = current_user.owned_listings
  end

end
