class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if logged?
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to users_path
      else
        render 'edit'
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, flash: {success: "Successfully Sign up"}
    else
      render 'new'
    end
  end

  def destroy
    if logged?
      @user = User.find(params[:id])
      @user.destroy

      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
  end

  def logged?
    session[:user_name]
  end
end
