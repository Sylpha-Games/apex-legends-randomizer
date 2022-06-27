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

ActiveRecord::Schema.define(version: 2022_06_27_052742) do

  create_table "ammos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battle_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "legend_id"
    t.bigint "weapon_id"
    t.bigint "stage_id"
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legend_id"], name: "index_battle_records_on_legend_id"
    t.index ["stage_id"], name: "index_battle_records_on_stage_id"
    t.index ["user_id"], name: "index_battle_records_on_user_id"
    t.index ["weapon_id"], name: "index_battle_records_on_weapon_id"
  end

  create_table "legends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.bigint "weapon_category_id"
    t.bigint "ammo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ammo_id"], name: "index_weapons_on_ammo_id"
    t.index ["weapon_category_id"], name: "index_weapons_on_weapon_category_id"
  end

  add_foreign_key "battle_records", "legends"
  add_foreign_key "battle_records", "stages"
  add_foreign_key "battle_records", "users"
  add_foreign_key "battle_records", "weapons"
  add_foreign_key "weapons", "ammos"
  add_foreign_key "weapons", "weapon_categories"
end
