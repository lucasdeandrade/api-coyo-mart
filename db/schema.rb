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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_005314) do
  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "unit_type"
    t.integer "stock"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured"
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "products", "categories"
end
