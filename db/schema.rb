# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_163942) do

  create_table "albums", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "shared", default: true
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "albums_photos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "photo_id", null: false
    t.index ["album_id", "photo_id"], name: "index_albums_photos_on_album_id_and_photo_id"
    t.index ["photo_id", "album_id"], name: "index_albums_photos_on_photo_id_and_album_id"
  end

  create_table "follows", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followed_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "time"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "shared", default: true
    t.bigint "user_id", null: false
    t.integer "like"
    t.string "photoFileName"
    t.bigint "photoFileSize"
    t.string "photoType"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "photos_albums", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "album_id"
    t.bigint "photo_id"
    t.index ["album_id"], name: "index_photos_albums_on_album_id"
    t.index ["photo_id"], name: "index_photos_albums_on_photo_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "password"
    t.datetime "lastLogin"
    t.string "avatarFileName"
    t.bigint "avatarFileSize"
    t.string "avatarType"
  end

  add_foreign_key "albums", "users"
  add_foreign_key "albums_photos", "albums"
  add_foreign_key "albums_photos", "photos"
  add_foreign_key "photos", "users"
end
