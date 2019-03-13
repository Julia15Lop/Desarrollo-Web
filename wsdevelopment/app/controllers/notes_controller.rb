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

	def update
  	@note = Article.find(params[:id])
 
  	if @note.update(note_params)
    		redirect_to @note
  	else
    		render 'edit'
  		end
	end


	def create
		@note = Note.new(note_params)
 
  		@note.save
  		redirect_to @note
  	end

  	private
  		def note_params
    		params.require(:note).permit(:title, :text)
  		end


end
