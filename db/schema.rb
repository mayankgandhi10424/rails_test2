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

ActiveRecord::Schema.define(version: 2018_17_30_070877) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id"
    t.index ["supplier_id"], name: "index_accounts_on_supplier_id", unique: true
  end

  create_table "apples", id: :serial, force: :cascade do |t|
    t.string "variety"
  end

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.integer "physician_id"
    t.integer "patient_id"
    t.datetime "appointment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "article"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "assemblies", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "assemblies_parts", id: :serial, force: :cascade do |t|
    t.integer "assembly_id"
    t.integer "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_id"], name: "index_assemblies_parts_on_assembly_id"
    t.index ["part_id"], name: "index_assemblies_parts_on_part_id"
  end

  create_table "authors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_count"
  end

  create_table "bests_tests", id: false, force: :cascade do |t|
    t.integer "test_id", null: false
    t.integer "best_id", null: false
    t.index ["best_id"], name: "index_bests_tests_on_best_id"
    t.index ["test_id"], name: "index_bests_tests_on_test_id"
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.integer "author_id"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "types"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "customers_products", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", id: :serial, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "guest"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_guests_on_comment_id"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jaspreets", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jasp_id"
  end

  create_table "jasps", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "content"
    t.integer "section_id"
    t.index ["section_id"], name: "index_paragraphs_on_section_id"
  end

  create_table "parts", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "patients", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.integer "phone"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone"
  end

  create_table "physicians", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id"
  end

  create_table "product_1s", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 5, scale: 2
    t.string "supplier_type"
    t.integer "supplier_id"
    t.index ["supplier_type", "supplier_id"], name: "index_product_1s_on_supplier_type_and_supplier_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "name", default: "soap", null: false
    t.text "description", default: "yes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "part_number", default: "TRUE"
    t.decimal "price", default: "5.2"
    t.boolean "approved", default: -> { "(0)::boolean" }
    t.integer "test_id"
    t.integer "test_int"
    t.index ["test_id"], name: "index_products_on_test_id"
  end

  create_table "sections", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "document_id"
    t.index ["document_id"], name: "index_sections_on_document_id"
  end

  create_table "suppliers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_tags_on_article_id"
  end

  create_table "tests", id: :serial, force: :cascade do |t|
    t.text "part_number"
    t.string "size"
    t.index ["part_number"], name: "index_tests_on_part_number"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "email"
    t.string "location"
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.string "type"
    t.string "color"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", id: :serial, force: :cascade do |t|
    t.integer "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_workers_on_manager_id"
  end

  add_foreign_key "accounts", "suppliers"
  add_foreign_key "articles", "categories"
  add_foreign_key "comments", "articles"
  add_foreign_key "guests", "comments"
  add_foreign_key "paragraphs", "sections"
  add_foreign_key "sections", "documents"
  add_foreign_key "tags", "articles"
end
