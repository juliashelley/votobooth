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

ActiveRecord::Schema.define(version: 2019_03_14_120129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatures", force: :cascade do |t|
    t.string "picture"
    t.string "name"
    t.string "video_url"
    t.string "status", default: "Pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "election_id"
    t.string "promise1"
    t.string "promise2"
    t.string "promise3"
    t.text "tagline"
    t.index ["election_id"], name: "index_candidatures_on_election_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "description"
    t.datetime "voting_start_date"
    t.datetime "voting_end_date"
    t.datetime "campaign_close_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "eligible_voters_string"
    t.index ["user_id"], name: "index_elections_on_user_id"
  end

  create_table "eligible_voters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "election_id"
    t.bigint "user_id"
    t.index ["election_id"], name: "index_eligible_voters_on_election_id"
    t.index ["user_id"], name: "index_eligible_voters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "candidature_id"
    t.bigint "eligible_voter_id"
    t.index ["candidature_id"], name: "index_votes_on_candidature_id"
    t.index ["eligible_voter_id"], name: "index_votes_on_eligible_voter_id"
  end

  add_foreign_key "candidatures", "elections"
  add_foreign_key "candidatures", "users"
  add_foreign_key "elections", "users"
  add_foreign_key "eligible_voters", "elections"
  add_foreign_key "eligible_voters", "users"
  add_foreign_key "votes", "candidatures"
  add_foreign_key "votes", "eligible_voters"
end
