class Listing < ApplicationRecord
  has_many :images

  def as_json()
    super(:only => [:id, :price,:unit_num, :streetnum,:streetname,:city,:state, :country,:zipcode,:latitude,:longitude,:status,:property_desc,:property_type,:sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees],
          :include => {
                :images =>{:only => [:image_url]}
          }
    )
  end

end
