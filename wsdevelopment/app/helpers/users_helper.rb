module UsersHelper
  def user_session_is_admin?
    if logged?
      admin = User.where(user_name: session[:user_name]).first.admin
    end
    admin
  end

  def get_user_name(user_id)
  	user = User.where(id: user_id).first
  end

  def get_user_id(user_name)
    user = User.find_by(user_name: user_name).id
  end
  def logged?
    session[:user_name]
  end
end
