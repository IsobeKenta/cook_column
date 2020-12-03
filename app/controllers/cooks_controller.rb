class CooksController < ApplicationController
  before_action :move_to_index, only: [:new, :edit]

  def index
    @cooks = Cook.includes(:user).order("created_at DESC")
  
  end

  def new
    @cook = CooksTag.new
  end

  def create
    @cook = CooksTag.new(cook_params)
    if @cook.valid?
      @cook.save
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
    @comment = Comment.new
    @comments = @cook.comments.includes(:user)
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end

  private
  def cook_params
    params.require(:cooks_tag).permit(:title, :text, :genre_id, :video, :name, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
