class CooksController < ApplicationController
  before_action :move_to_index, only: [:new, :edit]

  def index
    @cooks = Cook.all
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @cook = Cook.find(params[:id])
    if user_signed_in? && @cook.user_id == current_user.id
      edit_cook_path
    else
      redirect_to root_path
    end
  end

  def update
    @cook = Cook.find(params[:id])
    @cook.update(cook_params)
    if @cook.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    if @cook.destroy
      redirect_to root_path
    end
  end

  def show
    @cook = Cook.find(params[:id])
  end

  private
  def cook_params
    params.require(:cook).permit(:title, :text, :genre_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
