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

ActiveRecord::Schema.define(version: 2018_11_30_030419) do

  create_table "identities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "is_active"
    t.datetime "last_verify_at1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "display_name"
    t.string "nick_name"
    t.string "email"
    t.boolean "activated", default: false
    t.boolean "disabled", default: false
    t.boolean "api_disabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "member_id"
    t.string "token"
    t.boolean "is_used", default: false
    t.datetime "expire_at"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
