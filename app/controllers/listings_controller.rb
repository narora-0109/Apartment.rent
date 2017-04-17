class ListingsController < ApplicationController
  def index
    #@listings = Listing.all
    #render :json => @listings.as_json
  end

  def show
    #@listings = Listing.find_by_city('Union City')
    @listings = Listing.all
    render :json => @listings.as_json
    #render :json => {price: '2200', streetname: 'Arizona Street', city: 'Union City', zipcode: '94587'}
  end

  def new
    @listing = Listing.new
    #@picture = @listing.pictures.new
  end

  def create
    @listing = Listing.new(listing_params)
      if @listing.save
        params[:listing]['pictures'].each do |file|
          @listing.pictures.create!(:picture_json => file)
        end
          flash[:notice] = "Listing added successfully!"
          redirect_to 'apartments'
      else
        flash[:alert] = "Error creating Listing!"
        render :new
      end
  end

  def delete
    @listing = Listing.find_by(params[:id])
    if @listing.destroy
      flash[:notice] = "Listing deleted successfully!"
      redirect_to root
    else
      flash[:alert] = "Error deleting listing!"
    end
  end

  def update
    @listing = Listing.find_by(params[:id])
    if @listing.update_attributes(listing_params)
    flash[:notice] = "Listing updated successfully!"
    redirect_to root
    else
    flash[:alert] = "Error updating listing!"
    render :update
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:unit_num,:streetnum,:streetname,:city,:state,:country,:zipcode,:price,:latitude,:longitude,:property_desc,:property_type, :sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees, :picture_json)
  end

end
