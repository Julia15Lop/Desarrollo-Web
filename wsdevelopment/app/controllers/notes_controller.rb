class NotesController < ApplicationController
  def index
    @note = Note.all
  end
  def show
    @note = Note.find(params[:id])
  end

  def new
    @note=Note.new
  end
  def edit
    @note = Note.find(params[:id])
  end

  def update
    if logged?
      @note = Note.find(params[:id])

      if @note.update(note_params)
        redirect_to user_notes_url(@note.user_id)
      else
        render 'edit'
      end
    end
  end


  def create
    if logged?
      @user = User.find(params[:user_id])
      @note = @user.notes.create(note_params)

      if @note.save
        redirect_to user_notes_url(@user)
      else
        render 'new'
      end
    end
  end

  def destroy
    if logged?
      @note = Note.find(params[:id])
      @user = User.find(@note.user_id)
      @note.destroy

      redirect_to user_notes_url(@user)
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :image)
  end

  def logged?
    session[:user_name]
  end
end
