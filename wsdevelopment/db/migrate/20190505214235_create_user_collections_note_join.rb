class CreateUserCollectionsNoteJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :note_collections_users, :id => false do |t|
      t.integer :user_id
      t.integer :note_collection_id
    end

    add_index :note_collections_users, [:user_id, :note_collection_id], :name => "collection_user_index"
  end
end
