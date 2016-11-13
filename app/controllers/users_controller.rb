class UsersController < ApplicationController

  def show
    @users = User.find(params[:id])
    @users = current_user

  end

  def delete
  end

end
