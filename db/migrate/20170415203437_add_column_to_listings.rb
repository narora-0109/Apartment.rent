class AddColumnToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :pictures, :text
  end
end
