namespace :note_permissions do
  desc "Populate note permissions"
  task populate_note_permissions: :environment do
    Note.where(note_permission_id: nil).each do |note|
      np = NotePermission.create({note: note})
      np.user << note.user
    end
  end

end
