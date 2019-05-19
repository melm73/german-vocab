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

ActiveRecord::Schema.define(version: 2019_05_18_104319) do

  create_table "reviews", force: :cascade do |t|
    t.boolean "correct"
    t.integer "translation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translation_id"], name: "index_reviews_on_translation_id"
  end

  create_table "translations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "word_id"
    t.boolean "seen"
    t.string "translation"
    t.text "example"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "known"
    t.index ["user_id", "word_id"], name: "index_translations_on_user_id_and_word_id", unique: true
    t.index ["user_id"], name: "index_translations_on_user_id"
    t.index ["word_id"], name: "index_translations_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "german"
    t.string "level"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "article"
    t.string "plural"
  end

end
