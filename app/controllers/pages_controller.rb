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
    gibbon = Gibbon::Request.new(api_key: 'fbb7c1c8ec64a89efa370dd401a386d7-us22')
    email_address = params[:email_address]
    if gibbon.lists('6a583e5cf0').members.create(body: { email_address:, status: 'subscribed' })
      flash[:alert] = 'Successfully subscribed!'
    else
      flash[:alert] = 'Something went wrong. Please try again later or reach out to the Daytm Team directly.'
    end
    redirect_to root_path
  end
end
