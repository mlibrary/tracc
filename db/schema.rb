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

ActiveRecord::Schema.define(version: 2019_07_24_011019) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_type"
    t.string "document_id"
    t.string "document_type"
    t.binary "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_bookmarks_on_document_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "request_type"
    t.string "i_or_p"
    t.string "requester_name"
    t.string "requester_email"
    t.string "requester_div"
    t.string "contact_names"
    t.string "title"
    t.string "short_description"
    t.string "prev_work"
    t.string "accomplish"
    t.string "benefits"
    t.string "goal_alignment"
    t.string "at_stake"
    t.string "ext_pressure"
    t.string "non_tech"
    t.string "time_constraints"
    t.string "priority"
    t.string "sponsor"
    t.string "more_info"
    t.string "short_name"
    t.string "start_cycle"
    t.string "done_cycle"
    t.string "card_status"
    t.string "ext_link"
    t.string "lit_lead"
    t.string "lit_dept"
    t.string "service_lead"
    t.string "other_contacts"
    t.string "comments"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.binary "query_params"
    t.integer "user_id"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "strategic_sortings", force: :cascade do |t|
    t.integer "card_id"
    t.string "domain"
    t.string "enthusiasm"
    t.string "knowledge"
    t.string "resource"
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_strategic_sortings_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
