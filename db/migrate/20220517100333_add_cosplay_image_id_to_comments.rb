class AddCosplayImageIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :cosplay_image_id, :integer
  end
end
