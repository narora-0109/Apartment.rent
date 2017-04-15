class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column :images, :listings_id, :listing_id
  end
end
