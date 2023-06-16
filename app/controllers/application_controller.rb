class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_new_user_suggestion
  before_action :get_suggestions
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def set_new_user_suggestion
    @user_suggestion = UserSuggestion.new
    @member = Member.new
  end

  def get_suggestions
    @suggestions = Suggestion.all.reject do |suggestion|
      suggestion.users.include?(current_user)
    end.take(5)
  end
end
