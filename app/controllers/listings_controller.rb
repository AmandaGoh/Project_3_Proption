class ListingsController < ApplicationController
  def index
    @all_listings = Property.listed
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def mylistings
    @current_user_listings = current_user.owned_listings
  end

  def bidhistory

  end

end
