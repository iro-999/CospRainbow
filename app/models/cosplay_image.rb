class CosplayImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :title, presence: true
  validates :character, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @cosplay_image = CosplayImage.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @cosplay_image = CosplayImage.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @cosplay_image = CosplayImage.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @cosplay_image = CosplayImage.where("title LIKE?","%#{word}%")
    else
      @cosplay_image = CosplayImage.all
    end
  end

end
