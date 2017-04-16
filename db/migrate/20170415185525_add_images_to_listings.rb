class AddImagesToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :pictures, :json
  end
end
