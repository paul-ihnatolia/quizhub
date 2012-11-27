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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121127120758) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.boolean  "right"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "question_id"
    t.integer  "user_answer_id"
  end

  create_table "poll_boards", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "body"
  end

  create_table "poll_categories", :force => true do |t|
    t.string   "name"
    t.integer  "poll_board_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "multiple_answers", :default => false
  end

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "poll_category_id"
    t.integer  "original_list_number"
  end

  create_table "user_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "answer_id"
    t.integer  "attempt_no"
    t.boolean  "right",       :default => true
  end

end
