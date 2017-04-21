class ListingsController < ApplicationController
  def index

  end

  def show
    @listings = Listing.by_city(params[:city].downcase).by_state(params[:state].downcase).by_bathroom(params[:bathrooms]).by_price(params[:min_price], params[:max_price]).by_bedrooms(params[:bedrooms]).by_pets(params[:pets])
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
    @listing = Listing.where(:id => params[:id])
    if @listing.delete()
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
