class HomeController < ApplicationController
  def index
    @listing = Property.where('listed > ?', 0).last(4)
  end

  def about
  end

  def contact
  end
end
