# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141029232017) do

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "town_id"
    t.string   "subhead"
  end

  add_index "issues", ["town_id"], name: "index_issues_on_town_id"

  create_table "parties", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "towns", force: true do |t|
    t.string   "name"
    t.text     "intro"
    t.string   "image_url"
    t.integer  "issues_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "towns", ["issues_id"], name: "index_towns_on_issues_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "yob"
    t.integer  "gender"
    t.integer  "my_town_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["my_town_id"], name: "index_users_on_my_town_id"
  add_index "users", ["party_id"], name: "index_users_on_party_id"

  create_table "votes", force: true do |t|
    t.boolean  "up"
    t.integer  "issue_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["issue_id"], name: "index_votes_on_issue_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
