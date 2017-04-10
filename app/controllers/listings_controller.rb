class ListingsController < ApplicationController

  def show
    @listings = Listing.all
    render :json => @listings.to_json
    #render :json => {price: '2200', streetname: 'Arizona Street', city: 'Union City', zipcode: '94587'}
  end

  def create
    @listing = Listing.new
    if @listing.save
      #session[:name] = @user.name
      redirect_to action: 'show'
    else
      render 'show'
    end
  end

  def delete
  end
end
