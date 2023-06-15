class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
  end

  def show
    
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
