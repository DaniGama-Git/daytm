class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @collections = Collection.global_search(params[:query])
    else
      @collections = Collection.all
    end
    @collection = Collection.new
  end

  def show
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    if @collection.save
      redirect_to collections_path, notice: "#{@collection.label} has been created"
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
