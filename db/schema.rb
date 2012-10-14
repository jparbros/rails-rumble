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

ActiveRecord::Schema.define(:version => 20121014204506) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "organization_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "Organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "author_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "external_urls", :force => true do |t|
    t.string   "url"
    t.integer  "social_message_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "hashtags", :force => true do |t|
    t.string   "hashtag"
    t.integer  "campaign_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "mood"
  end

  create_table "historical_searches", :force => true do |t|
    t.integer  "hashtag_id"
    t.text     "terms"
    t.string   "last_message_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.integer  "social_message_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "incident_types", :force => true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "incidents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "incident_type_id"
    t.integer  "state_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "campaign_id"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "site"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_messages", :force => true do |t|
    t.string   "provider"
    t.string   "social_id"
    t.text     "content"
    t.integer  "incident_id"
    t.integer  "historical_search_id"
    t.string   "media_url"
    t.string   "external_url"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "organization_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
