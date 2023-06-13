class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_user_suggestion
  before_action :get_suggestions

  private

  def set_new_user_suggestion
    @user_suggestion = UserSuggestion.new
  end

  def get_suggestions
    @suggestions = Suggestion.all.reject do |suggestion|
      suggestion.users.include?(current_user)
    end
    
  end
end
