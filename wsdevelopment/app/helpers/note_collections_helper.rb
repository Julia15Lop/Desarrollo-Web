module NoteCollectionsHelper
  def find_collections(user_id)
    NoteCollection.select{|nc| nc.user_ids.include?(user_id)}
  end

  def find_notes_in_collection(collection_id)
  	NoteCollection.find(collection_id).note
  end
end
