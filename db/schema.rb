# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_30_193426) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "attack_power"
    t.integer "monster_id"
    t.index ["monster_id"], name: "index_abilities_on_monster_id"
  end

  create_table "monster_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "monster_type_id"
    t.index ["monster_type_id"], name: "index_monsters_on_monster_type_id"
  end

end
