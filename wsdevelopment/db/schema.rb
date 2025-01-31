# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_05_214235) do

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.integer "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "collections_notes", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collections_notes_on_collection_id"
    t.index ["note_id"], name: "index_collections_notes_on_note_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "note_collections", force: :cascade do |t|
    t.integer "creator_id"
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "note_collections_notes", force: :cascade do |t|
    t.integer "note_id"
    t.integer "note_collection_id"
    t.index ["note_id", "note_collection_id"], name: "note_index"
  end

  create_table "note_collections_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "note_collection_id"
    t.index ["user_id", "note_collection_id"], name: "collection_user_index"
  end

  create_table "note_permissions", force: :cascade do |t|
    t.integer "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "note_permissions_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "note_permission_id"
    t.index ["user_id", "note_permission_id"], name: "user_index"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "image"
    t.integer "note_permission_id"
    t.index ["note_permission_id"], name: "index_notes_on_note_permission_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
