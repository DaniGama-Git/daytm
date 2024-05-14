class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :create_mailchimp_member ]

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

  def create_mailchimp_member
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    email_address = params[:email]
    if gibbon.lists('6a583e5cf0').members.create(body: { email_address: , status: 'subscribed' })
      flash[:alert] = 'Successfully subscribed!'
    else
      flash[:alert] = 'Something went wrong. Please try again later or reach out to the Daytm Team directly.'
    end
    redirect_to root_path
  end
end
