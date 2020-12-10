class CooksController < ApplicationController
  before_action :move_to_index, only: [:new, :edit]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

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
      render :edit
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
    @cooks = Cook.search(params[:keyword])
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def cook_params
    params.require(:cooks_tag).permit(:title, :text, :resipe,:video, :name, :image, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

end
