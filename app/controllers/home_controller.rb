class HomeController < ApplicationController
  def index
    @listings = Property.where(listed: 1).last(4)
  end

  def about
  end

  def contact
  end
end
