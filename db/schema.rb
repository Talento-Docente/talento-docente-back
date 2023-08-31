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

ActiveRecord::Schema[7.0].define(version: 2023_08_31_225413) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alternatives", force: :cascade do |t|
    t.bigint "question_id"
    t.string "key"
    t.text "description"
    t.text "hint"
    t.integer "value", default: 1
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_alternatives_on_question_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.text "profesional_experience"
    t.string "phone"
    t.string "youtube"
    t.string "linkedin"
    t.string "briefcase"
    t.string "twitter"
    t.integer "english_level", default: 0
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: false
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "employments", force: :cascade do |t|
    t.bigint "establishment_id"
    t.text "title"
    t.text "description"
    t.integer "salary"
    t.integer "status", default: 0
    t.integer "employment_type", default: 0
    t.integer "qualification", default: 0
    t.integer "schedule_type", default: 0
    t.integer "hours", default: 0
    t.date "start_date"
    t.date "end_date"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flow_id"
    t.boolean "visible", default: false
    t.index ["establishment_id"], name: "index_employments_on_establishment_id"
    t.index ["flow_id"], name: "index_employments_on_flow_id"
  end

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dni"
  end

  create_table "flows", force: :cascade do |t|
    t.bigint "establishment_id"
    t.string "name"
    t.text "description"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_flows_on_establishment_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "establishment_id"
    t.integer "permission", default: 0
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_permissions_on_establishment_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "postulation_activities", force: :cascade do |t|
    t.bigint "postulation_id"
    t.bigint "stage_configuration_reference_id"
    t.integer "status", default: 0
    t.integer "reference_type", default: 0
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "realized_at", precision: nil
    t.datetime "realize_until", precision: nil
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postulation_id"], name: "pa_postulation_index"
    t.index ["resource_type", "resource_id"], name: "index_postulation_activities_on_resource"
    t.index ["stage_configuration_reference_id"], name: "pa_stage_configuration_reference_index"
  end

  create_table "postulations", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "employment_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stage_id"
    t.index ["applicant_id"], name: "index_postulations_on_applicant_id"
    t.index ["employment_id"], name: "index_postulations_on_employment_id"
    t.index ["stage_id"], name: "index_postulations_on_stage_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "test_id"
    t.integer "order_number", default: 1
    t.text "question"
    t.text "hint"
    t.integer "question_type", default: 0
    t.integer "value", default: 1
    t.string "group"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "stage_configuration_references", force: :cascade do |t|
    t.bigint "stage_configuration_id"
    t.string "name"
    t.string "description"
    t.integer "reference_type", default: 0
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id"], name: "index_stage_configuration_references_on_resource"
    t.index ["stage_configuration_id"], name: "index_stage_configuration_references_on_stage_configuration_id"
  end

  create_table "stage_configurations", force: :cascade do |t|
    t.bigint "stage_id"
    t.bigint "employment_id"
    t.string "meet_url"
    t.datetime "meet_date"
    t.datetime "date_end"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_id"], name: "index_stage_configurations_on_employment_id"
    t.index ["stage_id"], name: "index_stage_configurations_on_stage_id"
  end

  create_table "stages", force: :cascade do |t|
    t.bigint "flow_id"
    t.string "name"
    t.integer "order_number", default: 1
    t.text "description"
    t.integer "stage_type"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_stages_on_flow_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "establishment_id"
    t.string "name"
    t.string "description"
    t.integer "time_type", default: 0
    t.integer "time_value", default: 0
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_tests_on_establishment_id"
  end

  create_table "user_establishments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "establishment_id"
    t.integer "permission", default: 0
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["establishment_id"], name: "index_user_establishments_on_establishment_id"
    t.index ["user_id"], name: "index_user_establishments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.string "first_name"
    t.string "last_name"
    t.string "second_last_name"
    t.string "dni"
    t.date "birthday"
    t.datetime "deleted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "employments", "flows"
  add_foreign_key "postulations", "stages"
end
