class CommentsController < ApplicationController
  before_action :set_item, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.item = @item
    @comment.save
    redirect_to items_path(@items)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
