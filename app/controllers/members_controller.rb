class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
  end

  def create
  end
end
