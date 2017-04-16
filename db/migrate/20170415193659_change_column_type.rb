class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :listings, :images, :string
  end
end
