class Note < ApplicationRecord

validates :title, presence: true, length: {maximum: 10}
validates :text, presence: true

end
