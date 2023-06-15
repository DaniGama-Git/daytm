class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @collection = Collection.new
  end

  def landing
    @collection = Collection.new
  end
end
