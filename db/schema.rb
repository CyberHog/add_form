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

ActiveRecord::Schema.define(version: 20180420235505) do

  create_table "clinic_cards", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "patient_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_clinic_cards_on_clinic_id"
    t.index ["patient_id"], name: "index_clinic_cards_on_patient_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "receipt_id"
    t.integer "content_id"
    t.string "content_name"
    t.integer "price"
    t.integer "attached_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_menus_on_clinic_id"
    t.index ["receipt_id"], name: "index_menus_on_receipt_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "patients_receipts", force: :cascade do |t|
    t.integer "clinic_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_card_id"], name: "index_patients_receipts_on_clinic_card_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "patients_receipt_id"
    t.date "payday"
    t.string "service"
    t.integer "payment"
    t.integer "gained_point"
    t.string "payee"
    t.integer "payment_method", limit: 3, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patients_receipt_id"], name: "index_receipts_on_patients_receipt_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "business"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
