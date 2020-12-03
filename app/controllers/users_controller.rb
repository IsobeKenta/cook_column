class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @cooks = user.cooks.order("created_at DESC")
  end
end
