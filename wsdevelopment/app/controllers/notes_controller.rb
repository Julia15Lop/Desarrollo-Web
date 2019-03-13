class NotesController < ApplicationController
	  def index
    	@note = Note.all
  	end
	def show
    	@note = Note.find(params[:id])
  	end

	def new
	end

	def create
		@note = Note.new(note_params)
 
  		@note.save
  		redirect_to @note
  	end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    
    redirect_to notes_path
  end

  	private
  		def note_params
    		params.require(:note).permit(:title, :text)
  		end


end
