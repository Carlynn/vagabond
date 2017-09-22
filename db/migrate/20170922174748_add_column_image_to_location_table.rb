class AddColumnImageToLocationTable < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :background_image, :string
    add_column :locations, :icon_image, :string
    add_column :locations, :description, :string
    add_column :posts, :image, :string
  end
end
