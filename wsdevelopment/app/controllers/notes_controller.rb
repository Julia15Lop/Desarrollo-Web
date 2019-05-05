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
        np = NotePermission.create({note: @note})
        np.user << @user
        redirect_to user_notes_url(@user)
      else
        render 'new'
      end
    end
  end

  def share
    @note = Note.find(params["note_id"])
    @note_permission = @note.note_permission
  end

  def share_with_friend
    note = Note.find(params["note_id"])
    note_permission = note.note_permission
    note_permission.user << User.find(params[:friend_id])
    redirect_to user_note_share_url(note)
  end

  def unshare_with_friend
    note = Note.find(params["note_id"])
    note_permission = note.note_permission
    note_permission.user.delete(User.find(params[:friend_id]))
    redirect_to user_note_share_url(note)
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
