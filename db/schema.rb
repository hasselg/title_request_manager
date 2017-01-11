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

ActiveRecord::Schema.define(version: 20170111020254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "title_requests", force: :cascade do |t|
    t.text     "last_name"
    t.text     "first_name"
    t.text     "seller"
    t.text     "file_no"
    t.text     "bank"
    t.text     "prop_code"
    t.text     "parcel_no"
    t.text     "address"
    t.text     "county"
    t.text     "town"
    t.date     "order_recd"
    t.date     "fileopened"
    t.date     "patriot_ds"
    t.text     "lt_tt_w_fn"
    t.text     "memo"
    t.date     "tit_review"
    t.date     "commit_out"
    t.date     "commit_bck"
    t.date     "commit_iss"
    t.date     "close_date"
    t.date     "markup_rcd"
    t.date     "rec_pay"
    t.date     "rec_doc_rd"
    t.date     "redate_abs"
    t.date     "policy_out"
    t.date     "policy_bck"
    t.date     "policy_iss"
    t.date     "file_close"
    t.text     "or_recd_by"
    t.text     "review_by"
    t.decimal  "mtg_amount"
    t.text     "mtg_policy"
    t.text     "simult_mtg"
    t.text     "conv_polic"
    t.decimal  "fee_amount"
    t.text     "fee_policy"
    t.text     "m_pol_code"
    t.text     "o_pol_code"
    t.decimal  "b_prem_mtg"
    t.decimal  "b_prem_fee"
    t.text     "stand_code"
    t.decimal  "stand_amnt"
    t.text     "risk_code"
    t.decimal  "risk_amnt"
    t.decimal  "remit_amnt"
    t.decimal  "prior_amnt"
    t.decimal  "total_m_prem"
    t.decimal  "total_o_prem"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "underwriters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "abbreviation"
  end

  create_table "underwritings", force: :cascade do |t|
    t.integer  "underwriter_id"
    t.integer  "title_request_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["title_request_id"], name: "index_underwritings_on_title_request_id", using: :btree
    t.index ["underwriter_id"], name: "index_underwritings_on_underwriter_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,     null: false
    t.datetime "locked_at"
    t.boolean  "admin",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
