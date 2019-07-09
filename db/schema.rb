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

ActiveRecord::Schema.define(version: 20180515162950) do

  create_table "courses", force: :cascade do |t|
    t.string "number"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrolments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.integer "year"
    t.boolean "mentor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_mentor", default: false
    t.index ["course_id"], name: "index_enrolments_on_course_id"
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.float "feedback"
    t.integer "mentor_id"
    t.integer "user_id"
    t.boolean "if_finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_id"], name: "index_matches_on_mentor_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.integer "enrolment_id"
    t.float "hourly_rate"
    t.float "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "finished_student"
    t.index ["enrolment_id"], name: "index_mentors_on_enrolment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "firstName"
  end

end
