module FriendshipsHelper

	def get_friendships(user_id, status)
		friendships = Friendship.where(user_id: user_id, status: status)
	end

	def find_user(user_id)
  		User.where(id: user_id).first
  	end

  	def logged?
  		session[:user_name]
  	end
end
