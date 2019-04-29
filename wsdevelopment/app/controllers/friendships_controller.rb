class FriendshipsController < ApplicationController
  def index 
    @friendship = Friendship.all
  end

  def new 
    @friendship = Friendship.new
  end 

  def create
    @user = User.find(params[:user_id])
    @friendship = @user.friendships.create(:friend_id => params[:friend_id], :status => params[:status])

    if @friendship.save
      flash[:notice] = "Add friend."
      redirect_to users_path
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
