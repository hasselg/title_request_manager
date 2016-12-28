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

ActiveRecord::Schema.define(version: 20161217192042) do

  create_table "title_requests", force: :cascade do |t|
    t.text     "LAST_NAME"
    t.text     "FIRST_NAME"
    t.text     "SELLER"
    t.text     "FILE_NO"
    t.text     "BANK"
    t.text     "PROP_CODE"
    t.text     "PARCEL_NO"
    t.text     "ADDRESS"
    t.text     "COUNTY"
    t.text     "TOWN"
    t.date     "ORDER_RECD"
    t.date     "FILEOPENED"
    t.date     "PATRIOT_DS"
    t.text     "LT_TT_W_FN"
    t.text     "MEMO"
    t.date     "TIT_REVIEW"
    t.date     "COMMIT_OUT"
    t.date     "COMMIT_BCK"
    t.date     "COMMIT_ISS"
    t.date     "CLOSE_DATE"
    t.date     "MARKUP_RCD"
    t.date     "REC_PAY"
    t.date     "REC_DOC_RD"
    t.date     "REDATE_ABS"
    t.date     "POLICY_OUT"
    t.date     "POLICY_BCK"
    t.date     "POLICY_ISS"
    t.date     "FILE_CLOSE"
    t.text     "OR_RECD_BY"
    t.text     "REVIEW_BY"
    t.decimal  "MTG_AMOUNT"
    t.text     "MTG_POLICY"
    t.text     "SIMULT_MTG"
    t.text     "CONV_POLIC"
    t.decimal  "FEE_AMOUNT"
    t.text     "FEE_POLICY"
    t.text     "M_POL_CODE"
    t.text     "O_POL_CODE"
    t.decimal  "B_PREM_MTG"
    t.decimal  "B_PREM_FEE"
    t.text     "STAND_CODE"
    t.decimal  "STAND_AMNT"
    t.text     "RISK_CODE"
    t.decimal  "RISK_AMNT"
    t.decimal  "REMIT_AMNT"
    t.decimal  "PRIOR_AMNT"
    t.decimal  "TOTAL_M_PREM"
    t.decimal  "TOTAL_O_PREM"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
