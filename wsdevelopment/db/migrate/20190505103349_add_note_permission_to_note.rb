class AddNotePermissionToNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :note_permission, foreign_key: true
  end
end
