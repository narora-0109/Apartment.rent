class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :description, :image_url
  end
end
