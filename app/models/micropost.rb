class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:
    Settings.content_maximum}
  validate  :picture_size

  scope :order_micropost, ->{order created_at: :desc}
  scope :feed_query, ->{where  user_id: ids}

  private

  def picture_size
    return if picture.size > Settings.picture_size.megabytes
    errors.add :picture, t(".errors_add_picture_size")
  end
end
