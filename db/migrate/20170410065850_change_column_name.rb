class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :images, :description, :image_url
  end
end
