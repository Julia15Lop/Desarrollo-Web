class FriendshipController < ApplicationController
  def new
    @friendship = Friendship.new
  end
  
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      redirect_to root_path, flash: {success: "Successfully Sign up"}
    else
      render 'new'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
