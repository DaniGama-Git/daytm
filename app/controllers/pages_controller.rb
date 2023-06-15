class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      redirect_to collections_path
    else
      @collection = Collection.new
    end
  end

  def landing
    @collection = Collection.new
  end
end
