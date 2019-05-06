class CreateNoteCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :note_collections do |t|
      t.integer :creator_id
      t.text :title

      t.timestamps
    end
  end
end
