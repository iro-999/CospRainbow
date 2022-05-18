class CreateCosplayImages < ActiveRecord::Migration[6.1]
  def change
    create_table :cosplay_images do |t|
      t.integer  :user_id,      null: false
      t.string   :title,        null: false
      t.string   :character,    null: false
      t.string   :image,        null: false
      t.text     :body,         null: false
      t.timestamps              null: false
    end
  end
end
