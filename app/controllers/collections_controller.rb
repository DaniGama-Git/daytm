require "open-uri"

class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Collection)
      PgSearch::Multisearch.rebuild(Item)
      PgSearch::Multisearch.rebuild(Tag)
      PgSearch::Multisearch.rebuild(Member)
      pg_results = PgSearch.multisearch(params[:query])
      @results = pg_results.uniq
    else
      @collections = Collection.all
    end
    @collection = Collection.new
  end

  def show
    @collection = Collection.find(params[:id])
    @items = @collection.items
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user # Use lowercase 'collection' instead of 'Collection'
    # file = URI.open(collection_params.photo)
    # @collection.photo.attach(io: file, filename: "photo.png", content_type: "image/png")
    if @collection.save
      redirect_to root_path, notice: 'Collection was successfully created.'
    else
      render :new
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
    params.require(:collection).permit(:label, :description, :photos)
  end
end
