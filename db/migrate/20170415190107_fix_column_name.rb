class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :pictures, :images
  end
end
