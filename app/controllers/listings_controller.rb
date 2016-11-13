class ListingsController < ApplicationController
  def index
    @listings = Property.where(listed: 1)
  end


  def show
    @listing = Listing.find(params[:id])
  end

  def mylistings
    @current_user_listings = current_user.owned_listings
  end

  def new
    @listing = Listing.new
  end
  def create
    # edit curr_property listed to 1
    # create new listing with curr_property id
    current_user
    @my_properties=current_user.properties
    @new_listing = Listing.new()
    @new_listing.auction_date =
    @new_listing.duration =
    @new_listing.property_id =
    @new_listing.save
    redirect_to mylisting_path



  end
end
