class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  
  def self.search(search)
    if search
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
  
  has_many :reverses_of_favorite, class_name: 'Favorite'
  has_many :likers, through: :reverses_of_favorite, source: :user, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :like_users, through: :favorites, source: :user
  
  has_many :comments, dependent: :destroy
  
  mount_uploader :image, ImageUploader
end
