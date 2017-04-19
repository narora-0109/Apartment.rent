class Listing < ApplicationRecord
  validates :price, presence: true
  before_save :downcase_fields

  has_many :pictures
  serialize :picture_json, JSON

  #attr_accessor :picture_data

  def downcase_fields
    self.city.downcase!
    self.state.downcase!
    self.country.downcase!
  end

  def as_json()
    super(:only => [:id, :price,:unit_num, :streetnum,:streetname,:city,:state, :country,:zipcode,:latitude,:longitude,:status,:property_desc,:property_type,:sq_ft,:bedrooms, :bathrooms, :pets,:leasing_fees],
          :include => {
              :pictures =>{:only => [:picture_json]}
          }
     )
  end
end
