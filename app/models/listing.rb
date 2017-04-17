class Listing < ApplicationRecord
  validates :price, presence: true


  has_many :pictures
  serialize :picture_json, JSON

  #attr_accessor :picture_data

  def as_json()
    super(:only => [:id, :price,:unit_num, :streetnum,:streetname,:city,:state, :country,:zipcode,:latitude,:longitude,:status,:property_desc,:property_type,:sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees],
          :include => {
              :pictures =>{:only => [:picture_json]}
          }
     )
  end
end
