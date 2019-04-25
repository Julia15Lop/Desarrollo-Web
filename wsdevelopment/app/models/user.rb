class User < ApplicationRecord

  has_many :notes, dependent: :destroy
  has_and_belongs_to_many :friendship, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :user_name, presence: true, length: { maximum: 10 },
    uniqueness: { case_sensitive: false }
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i
  validates :email, presence: true, format: { with: REGEX_EMAIL },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }

end
