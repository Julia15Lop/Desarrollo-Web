module NotesHelper

  def find_notes(user_id)
    Note.where(user_id: user_id)
  end

end
