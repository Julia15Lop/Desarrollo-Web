class CreateNotePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :note_permissions do |t|
      t.integer :note_id

      t.timestamps
    end
  end
end
