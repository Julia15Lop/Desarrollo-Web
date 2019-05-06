class NoteCollectionsController < ApplicationController

  def index
    @collection = NoteCollection.all
  end

  def edit
    @note_collection = NoteCollection.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    nc = NoteCollection.create({title: params[:title], creator_id: params[:user_id]})
    nc.user << @user
    redirect_to user_note_collections_url
  end

  def update
    @note_collection = NoteCollection.find(params[:id])
    @note_collection.update_column(:title, params[:note_collection][:title])
    redirect_to user_note_collections_url
  end

  def destroy
    if session[:user_name]
      @collection = NoteCollection.find(params[:id])

      if @collection.destroy
        redirect_to user_note_collections_url
      end
    end
  end

  def add_note_to
    if session[:user_name]
      note = Note.find(params[:note_id])
      @note_collection = NoteCollection.find(params[:id]).note << note
      redirect_to user_note_collections_url
    end
  end

end
