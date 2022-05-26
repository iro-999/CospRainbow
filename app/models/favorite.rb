class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :cosplay_image
  
end
