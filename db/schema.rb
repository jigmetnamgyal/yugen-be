# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_221_012_220_009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'attachments', force: :cascade do |t|
    t.string 'attachable_type'
    t.bigint 'attachable_id'
    t.bigint 'user_id'
    t.integer 'category'
    t.integer 'file_size'
    t.string 'file_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[attachable_type attachable_id], name: 'index_attachments_on_attachable'
    t.index ['user_id'], name: 'index_attachments_on_user_id'
  end

  create_table 'grants', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'title', null: false
    t.text 'description', null: false
    t.string 'website_url'
    t.string 'social_media_url'
    t.integer 'grant_review_status', default: 0
    t.float 'lifetime_funding_received'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.date 'start_date'
    t.date 'end_date'
    t.float 'total_voting_power'
    t.index ['user_id'], name: 'index_grants_on_user_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.float 'matching_pool_contribution', default: 0.0, null: false
    t.integer 'payment_type', default: 0, null: false
    t.bigint 'user_id', null: false
    t.bigint 'project_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'payment_completed', default: false
    t.index ['project_id'], name: 'index_orders_on_project_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'profiles', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'document_number', null: false
    t.integer 'kyc_status', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'wallet_address'
    t.integer 'document_type'
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.float 'funding_received'
    t.string 'project_title', null: false
    t.string 'project_description', null: false
    t.string 'website_url', null: false
    t.string 'social_media_url', null: false
    t.integer 'total_contributor', default: 0, null: false
    t.bigint 'grant_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.float 'goal_amount'
    t.float 'voting_power'
    t.float 'grant_contribution'
    t.index ['grant_id'], name: 'index_projects_on_grant_id'
    t.index ['user_id'], name: 'index_projects_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email_address', null: false
    t.string 'jti', null: false
    t.string 'password', null: false
    t.string 'name', null: false
    t.string 'phone_number', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email_address'], name: 'index_users_on_email_address', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['phone_number'], name: 'index_users_on_phone_number', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'attachments', 'users'
  add_foreign_key 'grants', 'users'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'profiles', 'users'
  add_foreign_key 'projects', 'grants'
  add_foreign_key 'projects', 'users'
end
