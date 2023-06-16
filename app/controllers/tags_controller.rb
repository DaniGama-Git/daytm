class TagsController < ApplicationController

  def index
    @tags = Tag.all.where(user: current_user)
  end

  def new
  end

  def show
    @collection = Collection.new
    @tag = Tag.find(params[:id])
    @items = @tag.items
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user = current_user
    if @tag.save
      redirect_to new_item_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
