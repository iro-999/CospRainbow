class RemoveImageFromCosplayImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :cosplay_images, :image, :string
  end
end
