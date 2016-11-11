class UsersController < ApplicationController
  
  def show
    @users = User.find(params[:id])

  end

  def delete
  end

end
