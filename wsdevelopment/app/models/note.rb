class Note < ApplicationRecord

  belongs_to :user
  has_one :note_permission, dependent: :destroy

  validates :title, presence: true, length: {maximum: 10}
  validates :text, presence: true

mount_uploader :image, ImageUploader
end
