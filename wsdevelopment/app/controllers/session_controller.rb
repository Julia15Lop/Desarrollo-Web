class SessionController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by user_name: params[:user_name]

  	if @user && @user.authenticate(params[:password_digest])
  		session[:user_name] = @user.user_name
  		if @user.admin
  			redirect_to users_url
  		else 
  			redirect_to user_notes_url(@user)
  		end
  	else
  		flash[:warning] = 'Invalid Username or Password! Try again'
  		redirect_to root_path
  	end
  end

  def destroy
  	session[:user_name] = nil
  	flash[:success] = "Successfully Logged Out!"
  	redirect_to root_path
  end
end