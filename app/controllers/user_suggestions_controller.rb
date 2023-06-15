class UserSuggestionsController < ApplicationController

  def create
    @suggestions = Suggestion.where(id: params[:user_suggestion][:suggestion])
    @suggestions.each do |suggestion|
      @user_suggestion = UserSuggestion.new
      @user_suggestion.user = current_user
      @user_suggestion.suggestion = suggestion
      @user_suggestion.save
    end
    if @user_suggestion.save
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end
end
