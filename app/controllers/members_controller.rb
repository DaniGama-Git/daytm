class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
  end

  def show
    @collection = Collection.new
    @member = Member.find(params[:id])
    # @items = @member.items
  end

  def create
    @member = Member.new(member_params)
    @member.user = current_user
    if @member.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end
end
