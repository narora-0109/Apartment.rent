class ListingsController < ApplicationController
  def index
  end

  def show
    @listings = Listing.all
    render :json => @listings.as_json
    #render :json => {price: '2200', streetname: 'Arizona Street', city: 'Union City', zipcode: '94587'}
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
      if @listing.save
        #session[:name] = @user.name
        flash[:notice] = "Listing added successfully!"
        #redirect_to action: 'show'
        redirect_to 'apartments'
      else
        flash[:alert] = "Error creating Listing!"
        render :new
      end
  end

  def delete
    if @post.destroy
      flash[:notice] = "Listing deleted successfully!"
      redirect_to posts_path
    else
      flash[:alert] = "Error deleting listing!"
    end
  end

  def update
    if @listing.update_attributes(listing_params)
    flash[:notice] = "Listing updated successfully!"
    redirect_to 'apartments'
    else
    flash[:alert] = "Error updating listing!"
    render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:unitnum,:streetnum, :streetname,:city,:state,:country,:zipcode, :price,:latitude,:longitude,:property_desc,:property_type, :sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees)
  end
end
