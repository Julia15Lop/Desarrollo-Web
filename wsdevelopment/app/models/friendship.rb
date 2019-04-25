class Friendship < ApplicationRecord
	has_and_belongs_to_many :user
	
	STATUSES = [ "pending", "confirmed", "denied" ].freeze
	

end
