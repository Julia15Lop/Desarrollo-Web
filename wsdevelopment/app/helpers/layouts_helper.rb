module LayoutsHelper
	def user_id(user_name)
		User.where(user_name: user_name).first.id
	end
end
