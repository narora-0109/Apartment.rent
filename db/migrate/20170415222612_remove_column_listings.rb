class RemoveColumnListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :pictures
  end
end
