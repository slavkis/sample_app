class Micropost < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user

default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 150 }
  validate :picture_size

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB, bro")
    end
  end

end
