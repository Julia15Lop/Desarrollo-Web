class Note < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: {maximum: 10}
  validates :text, presence: true

end
