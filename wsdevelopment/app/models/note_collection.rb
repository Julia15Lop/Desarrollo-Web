class NoteCollection < ApplicationRecord

  has_and_belongs_to_many :user
  has_and_belongs_to_many :note

end
