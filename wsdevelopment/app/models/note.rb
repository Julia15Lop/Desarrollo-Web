class Note < ApplicationRecord

  belongs_to :user
  has_one :note_permission, dependent: :destroy
  has_many :collections_notes, through: :collections_notes
  has_and_belongs_to_many :note_collection

  validates :title, presence: true, length: {maximum: 10}
  validates :text, presence: true

mount_uploader :image, ImageUploader
end
