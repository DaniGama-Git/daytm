class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy]

  def index
    @collections = Collection.all
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.index
    if @collection.save
      redirect_to @collection, notice: "#{@collection.label} has been created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: "#{@collection.label} has been updated"
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: "#{collection.label} has been deleted"
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:label, :description, :type)
  end
end
