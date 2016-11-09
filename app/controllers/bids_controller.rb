class BidsController < ApplicationController
  def index
    @bids = current_user.bid
  end

  def new
  end
end
