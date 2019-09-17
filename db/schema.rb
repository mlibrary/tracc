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

ActiveRecord::Schema.define(version: 2019_08_23_155309) do

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
    t.string "requester_fname"
    t.string "requester_lname"
    t.string "requester_email"
    t.string "requester_div"
    t.string "contact_names"
    t.string "title"
    t.string "short_description"
    t.string "prev_work"
    t.string "accomplish"
    t.string "accomplish_details"
    t.string "benefits"
    t.string "benefits_details"
    t.string "goal_alignment"
    t.string "at_stake"
    t.string "at_stake_details"
    t.string "ext_pressure"
    t.string "ext_pressure_details"
    t.string "non_tech"
    t.string "non_tech_details"
    t.string "time_constraints"
    t.string "time_constraints_details"
    t.string "priority"
    t.string "sponsor"
    t.string "more_info"
    t.string "short_name"
    t.string "in_cycle"
    t.string "start_cycle"
    t.string "done_cycle"
    t.string "exp_start_month"
    t.string "exp_end_month"
    t.string "lib_divisions"
    t.string "card_status"
    t.string "rationale"
    t.string "ext_link"
    t.string "lit_lead"
    t.string "lit_depts"
    t.string "service_lead"
    t.string "other_contacts"
    t.string "comments"
    t.string "domain"
    t.string "enthusiasm"
    t.string "knowledge"
    t.string "resource"
    t.string "investigation_scope"
    t.string "tech_knowledge"
    t.string "team_scope"
    t.string "infrastructure"
    t.string "application"
    t.string "front_end"
    t.string "data_content"
    t.decimal "total_complexity_score"
    t.string "cost"
    t.string "divergence"
    t.string "staff_resources"
    t.string "money"
    t.string "operational"
    t.decimal "total_cost_score"
    t.decimal "weighted_score"
    t.string "complexity_notes"
    t.decimal "benefit_score"
    t.decimal "accomplish_score"
    t.decimal "at_stake_score"
    t.decimal "pressures_score"
    t.decimal "change_score"
    t.decimal "impact_score"
    t.decimal "gut_check"
    t.string "impact_notes"
    t.datetime "card_since"
    t.datetime "last_update_comment"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "card_id"
    t.string "uemail"
    t.string "comment_txt"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complexities", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "comments"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_complexities_on_card_id"
  end

  create_table "cycle_reviews", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "rationale"
    t.string "cycle"
    t.string "notes"
    t.string "review_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cycle_reviews_on_card_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.string "cycle_name"
    t.string "description"
    t.date "start"
    t.date "end"
    t.boolean "current_cycle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impacts", force: :cascade do |t|
    t.integer "card_id"
    t.string "status"
    t.string "comments"
    t.datetime "recorded_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_impacts_on_card_id"
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
    t.datetime "recorded_on"
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
