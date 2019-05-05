class CreateNotesCollectionsNoteJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :note_collections_notes do |t|
      t.integer :note_id
      t.integer :note_collection_id
    end

    add_index :note_collections_notes, [:note_id, :note_collection_id], :name => "note_index"
  end
end
