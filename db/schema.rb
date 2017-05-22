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

ActiveRecord::Schema.define(version: 20170522213944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cover_letter_evaluations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cover_letter_file_name"
    t.string "cover_letter_content_type"
    t.integer "cover_letter_file_size"
    t.datetime "cover_letter_updated_at"
  end

  create_table "qualification_evaluations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "job_posting"
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "resume_evaluations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "resume_file_name"
    t.string "resume_content_type"
    t.integer "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
