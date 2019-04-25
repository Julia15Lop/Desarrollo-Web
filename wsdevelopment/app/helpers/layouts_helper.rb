module LayoutsHelper
	def user_id(user_name)
		User.where(user_name: user_name).first.id
	end

	def user_name(user_id)
		User.where(id: user_id).first
	end
end
