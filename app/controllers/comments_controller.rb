class CommentsController < ApplicationController
  before_action :set_item, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    @comment.time = Time.now
    @comment.item = @item

    respond_to do |format|
      if @comment.save
        format.html { redirect_to item_path(@item) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "items/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
