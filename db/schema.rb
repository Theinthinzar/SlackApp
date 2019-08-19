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

ActiveRecord::Schema.define(version: 2019_07_26_031302) do

  create_table "h_chmessage_replies", primary_key: "chmsgrp_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "chmsgid", null: false
    t.integer "chreplyer_id", null: false
    t.string "chthreadmsg", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chmsgid"], name: "chmsgid"
    t.index ["chreplyer_id"], name: "chreplyer_id"
  end

  create_table "h_dirmessage_replies", primary_key: "dirmsgrp_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "reply_user_id", null: false
    t.integer "dirmsg_id", null: false
    t.string "dirthread_msg", null: false
    t.boolean "is_read", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dirmsg_id"], name: "dirmsg_id"
    t.index ["reply_user_id"], name: "reply_user_id"
  end

  create_table "m_channels", primary_key: ["channel_id", "user_id", "workspace_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "channel_id", null: false, auto_increment: true
    t.string "channel_name", null: false
    t.integer "user_id", null: false
    t.integer "workspace_id", null: false
    t.boolean "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "chadmin", null: false
  end

  create_table "m_users", primary_key: "user_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "user_name", null: false
    t.string "user_email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.index ["user_email"], name: "user_email_UNIQUE", unique: true
  end

  create_table "m_workspaces", primary_key: ["workspace_id", "user_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "workspace_id", null: false, auto_increment: true
    t.integer "user_id", null: false
    t.string "workspace_name", null: false
    t.boolean "admin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_channel_messages", primary_key: "chmsg_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "chsender_id", null: false
    t.integer "channel_id", null: false
    t.string "chmessage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count"
    t.index ["channel_id"], name: "channel_id"
    t.index ["chsender_id"], name: "chsender_id"
  end

  create_table "t_chmsgstars", primary_key: ["chstar_id", "chmsgstarid", "chstar_userid"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "chstar_id", null: false, auto_increment: true
    t.integer "chstar_userid", null: false
    t.integer "chmsgstarid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chmsgstarid"], name: "chmsgstarid"
    t.index ["chstar_userid"], name: "chstar_userid"
  end

  create_table "t_chunread_messages", primary_key: ["chunmsg_id", "chmsg_id", "chuser_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "chunmsg_id", null: false, auto_increment: true
    t.integer "chmsg_id", null: false
    t.integer "chuser_id", null: false
    t.boolean "is_read", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_directstars", primary_key: ["dstar_id", "stardimsg_id", "star_userid"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "dstar_id", null: false, auto_increment: true
    t.integer "star_userid", null: false
    t.integer "stardimsg_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["star_userid"], name: "star_userid"
    t.index ["stardimsg_id"], name: "stardimsg_id"
  end

  create_table "t_dirmessages", primary_key: "dirmsg_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sender_user_id", null: false
    t.integer "receiver_user_id", null: false
    t.string "dir_message", null: false
    t.boolean "is_read", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dirworkspace_id", null: false
    t.integer "count"
    t.index ["dirworkspace_id"], name: "dirworkspace_id"
    t.index ["receiver_user_id"], name: "receiver_user_id"
    t.index ["sender_user_id"], name: "sender_user_id"
  end

  create_table "t_mentions", primary_key: ["mention_id", "workspace_id", "mentioned_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "mention_id", null: false, auto_increment: true
    t.integer "login_user_id", null: false
    t.integer "chmsgmen_id", null: false
    t.string "mention_message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mentioned_id", null: false
    t.integer "workspace_id", null: false
    t.index ["chmsgmen_id"], name: "chmsgmen_id"
    t.index ["login_user_id"], name: "login_user_id"
  end

  add_foreign_key "h_chmessage_replies", "m_users", column: "chreplyer_id", primary_key: "user_id", name: "chreplyer_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "h_chmessage_replies", "t_channel_messages", column: "chmsgid", primary_key: "chmsg_id", name: "chmsgid_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "h_dirmessage_replies", "m_users", column: "reply_user_id", primary_key: "user_id", name: "reply_user_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "h_dirmessage_replies", "t_dirmessages", column: "dirmsg_id", primary_key: "dirmsg_id", name: "dirmsg_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_channel_messages", "m_channels", column: "channel_id", primary_key: "channel_id", name: "channel_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_channel_messages", "m_users", column: "chsender_id", primary_key: "user_id", name: "chsender_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_chmsgstars", "m_users", column: "chstar_userid", primary_key: "user_id", name: "chstar_userid_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_chmsgstars", "t_channel_messages", column: "chmsgstarid", primary_key: "chmsg_id", name: "chmsgstarid_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_directstars", "m_users", column: "star_userid", primary_key: "user_id", name: "star_userid_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_directstars", "t_dirmessages", column: "stardimsg_id", primary_key: "dirmsg_id", name: "stardimsg_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_dirmessages", "m_users", column: "receiver_user_id", primary_key: "user_id", name: "receiver_user_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_dirmessages", "m_users", column: "sender_user_id", primary_key: "user_id", name: "sender_user_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_dirmessages", "m_workspaces", column: "dirworkspace_id", primary_key: "workspace_id", name: "dirworkspace_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_mentions", "m_channels", column: "chmsgmen_id", primary_key: "channel_id", name: "chmsgmen_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "t_mentions", "m_users", column: "login_user_id", primary_key: "user_id", name: "login_user_id_fk", on_update: :cascade, on_delete: :cascade
end
