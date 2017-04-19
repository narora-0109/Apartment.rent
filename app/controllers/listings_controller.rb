class ListingsController < ApplicationController
  def index

  end

  def show
    defaults = {'property_type' =>"Apartment", 'bedrooms' => "Studio", 'bathrooms' => "0.5", 'pets' => "Yes", 'city' => "union city", 'state' => 'ca'}
    copy_params = params
    params = defaults.merge(copy_params)
    @listings = Listing.where(:city => params['city'].downcase, :state => params['state'].downcase, bedrooms: params['bedrooms'], bathrooms: params['bathrooms'], pets: params['pets'], property_type: params['property_type'])
    render :json => @listings.as_json
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
      if @listing.save
        params[:listing]['pictures'].each do |file|
          @listing.pictures.create!(:picture_json => file)
        end
          flash[:notice] = "Listing added successfully!"
          redirect_to '/apartments'
      else
        flash[:alert] = "Error creating Listing!"
        render :new
      end
  end

  def delete
    @listing = Listing.find_by(params[:id])
    if @listing.destroy
      flash[:notice] = "Listing deleted successfully!"
      redirect_to 'listings/delete'
    else
      flash[:alert] = "Error deleting listing!"
    end
  end

  def update
    #@listing = Listing.find_by(params[:id])
    #if @listing.update(unit_num: params[:unit_num], streetname: params[:streetname], streetnum: params[:streetnum])
    #flash[:notice] = "Listing updated successfully!"
    #redirect_to root
    #else
    #flash[:alert] = "Error updating listing!"
    #render :update
    #end
  end

  private

  def listing_params
    params.require(:listing).permit(:unit_num,:streetnum,:streetname,:city,:state,:country,:zipcode,:price,:latitude,:longitude,:property_desc,:property_type, :sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees, :picture_json)
  end

end
