module UsersHelper
  def user_session_is_admin?
    if logged?
      admin = User.where(user_name: session[:user_name]).first.admin
    end
    admin
  end

  def logged?
    session[:user_name]
  end
end
