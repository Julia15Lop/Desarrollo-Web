class FriendshipsController < ApplicationController
  def index 
    @friendship = Friendship.all
  end

  def new 
    @friendship = Friendship.new
  end 

  def edit
    @friendship = Friendship.find(params[:id])
  end 

  def create
    @user = User.find(params[:user_id])
    @friendship = @user.friendships.create(:friend_id => params[:friend_id], :status => params[:status])

    if @friendship.save
      flash[:notice] = "Request sent"
      redirect_to user_friendships_url
    else
      flash[:notice] = "You can't add this user"
      redirect_to user_friendships_url
    end
  end

  def update
    if logged?
      @friendship = Friendship.find(params[:id])

      if @friendship.update(:status => params[:status])
        redirect_to user_friendships_url
      end
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
