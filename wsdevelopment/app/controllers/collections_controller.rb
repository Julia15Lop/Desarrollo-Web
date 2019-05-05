class CollectionsController < ApplicationController
  def index
    @collection = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @user = User.find(params[:user_id])
    if params[:notes]
      @collection = @user.collections.create(:name => params[:name], :notes => params[:notes])
    else
      @collection = @user.collections.create(:name => params[:name])
    end

    if @collection.save
      flash[:notice] = "collection created"
      redirect_to user_collections_url(@user.id)
    else
      render 'edit'
    end
  end

  def update
    if session[:user_name]
      @collection = collection.find(params[:id])

      if @collection.update(:notes => params[:notes])
        redirect_to user_collections_url
      else
        flash[:notice] = "The request has not been update"
        redirect_to user_collections_url
      end
    end
  end

  def destroy
    if session[:user_name]
      @collection = Collection.find(params[:id])

      if @collection.destroy
        redirect_to user_collections_url
      end
    end
  end
end
