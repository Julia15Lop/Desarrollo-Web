module NoteCollectionsHelper
  def find_collections(user_id)
    NoteCollection.select{|nc| nc.user_ids.include?(user_id)}
  end
end
