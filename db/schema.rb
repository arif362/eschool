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

ActiveRecord::Schema.define(version: 20170402185655) do

  create_table "course_klass_lists", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "klass_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "school_id",  limit: 4
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "school_id",  limit: 4
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "klasses", force: :cascade do |t|
    t.integer  "room_no",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email",      limit: 255
    t.integer  "school_id",  limit: 4
    t.integer  "course_id",  limit: 4
    t.string   "time",       limit: 255
    t.string   "duration",   limit: 255
    t.integer  "user_id",    limit: 4
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "address",         limit: 255
    t.string   "registration_no", limit: 255
    t.string   "country",         limit: 255
    t.string   "admin",           limit: 255
    t.string   "email",           limit: 255
    t.string   "mobile",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "salt",            limit: 255
    t.string   "hashed_password", limit: 255
  end

  create_table "user_assign_courses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "course_id",  limit: 4
    t.integer  "school_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "user_name",       limit: 255
    t.string   "role",            limit: 255
    t.string   "salt",            limit: 255
    t.string   "hashed_password", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email",           limit: 255
    t.integer  "school_id",       limit: 4
  end

end
