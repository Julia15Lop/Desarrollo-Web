class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, :class_name => 'User'
	
	STATUSES = [ "pending", "confirmed", "denied" ].freeze
	

end
