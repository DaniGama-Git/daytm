class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all.where(user: current_user)
    @collection = Collection.new
  end

  def show
    @comment = Comment.new
    @tags = Tag.all.where(user: current_user)
    @collections = Collection.all.where(user: current_user)
    @members = Member.all
    @collection = Collection.new
  end

  def new
    @item = Item.new
    @tags = Tag.where(user: current_user)
    @tag = Tag.new
    @members = Member.where(user: current_user)
    @collection = Collection.new
    @collections = Collection.where(user: current_user)
    @member_details = @members.map do |member|
      [member.first_name, member.id]
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @tags = Tag.where(id: params[:item][:tag_ids])
    @tags.each do |tag|
      @item.tags << tag
    end
    @collections = Collection.where(id: params[:item][:collection_ids])
    @collections.each do |collection|
      @item.collections << collection
    end
    if @item.save
      members = params[:item][:member_ids].map do |id|
        next if id.to_i == 0
        Member.find(id.to_i)
      end
      # tags = params.map do |id|
      #   next if id.to_i == 0
      #   Tag.find(id.to_i)
      # end

      # collections = params[:item][:collection_ids].map do |id|
      #   next if id.to_i == 0
      #   Collection.find(id.to_i)
      # end
      @item.members.push(members.compact)
      # @item.tags.push(tags.compact)
      # @item.collections.push(collections.compact)
      redirect_to @item, notice: "#{@item.title} has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tags = Tag.where(user: current_user)
    @members = Member.where(user: current_user)
    @collections = Collection.where(user: current_user)
    @member_details = @members.map do |member|
      [member.first_name, member.id]
    end

  end

  def update
    @item.tags.destroy_all
    @item.members.destroy_all
    @item.collections.destroy_all
    @item.update(item_params)
    @item.user = current_user
    if @item.save
      members = params[:item][:member_ids].map do |id|
        next if id.to_i == 0
        Member.find(id.to_i)
      end
      tags = params[:item][:tag_ids].map do |id|
        next if id.to_i == 0
        Tag.find(id.to_i)
      end
      collections = params[:item][:collection_ids].map do |id|
        next if id.to_i == 0
        Collection.find(id.to_i)
      end
      @item.members.push(members.compact)
      @item.tags.push(tags.compact)
      @item.collections.push(collections.compact)
      # respond_to do |format|
      redirect_to @item, notice: "#{@item.title} has been successfully updated."
      #   format.text { render }
      # end
    else
      render :new, status: :unprocessable_entity
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
    params.require(:item).permit(:title, :description, :format, :date, :tag_ids, :member_ids, photos: [])
  end
end
