class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "#{@item.title} has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "#{@item.title} has been succefully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "#{@item.title} has been succefully destroyed."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :comment, :format, :date, photos: [])
  end
end
