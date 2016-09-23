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

ActiveRecord::Schema.define(version: 20160912231253) do

  create_table "Title_Requests", force: :cascade do |t|
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
    t.text     "PATRIOT_DS"
    t.text     "LT_TT_W_FN"
    t.text     "MEMO"
    t.date     "TIT_REVIEW"
    t.date     "COMMIT_OUT"
    t.date     "COMMIT_BCK"
    t.date     "COMMIT_ISS"
    t.date     "CLOSE_DATE"
    t.date     "MARKUP_RCD"
    t.date     "REC_PAY_FN"
    t.text     "REC_PAY_W"
    t.text     "REC_PAY_TT"
    t.date     "REC_DOC_RD"
    t.text     "REDATE_ABS"
    t.date     "POLICY_OUT"
    t.date     "POLICY_BCK"
    t.date     "POLICY_ISS"
    t.date     "FILE_CLOSE"
    t.text     "OR_RECD_BY"
    t.text     "REVIEW_BY"
    t.decimal  "MTG_AMOUNT"
    t.decimal  "MTG_PREM"
    t.decimal  "FN_PREM_M"
    t.decimal  "FN_PREM_M2"
    t.decimal  "W_PREM_M3"
    t.decimal  "MTG_PREM_T"
    t.text     "MTG_POLICY"
    t.text     "SIMULT_MTG"
    t.text     "CONV_POLIC"
    t.decimal  "FEE_AMOUNT"
    t.decimal  "FEE_PREM"
    t.decimal  "FN_PREM_O"
    t.decimal  "FN_PREM_O2"
    t.decimal  "W_PREM_O3"
    t.decimal  "FEE_PREM_T"
    t.text     "FEE_POLICY"
    t.text     "M_POL_CODE"
    t.text     "O_POL_CODE"
    t.text     "B_PREM_MTG"
    t.decimal  "B_PREM_FEE"
    t.text     "STAND_CODE"
    t.decimal  "STAND_AMNT"
    t.text     "RISK_CODE"
    t.decimal  "RISK_AMNT"
    t.text     "FNTI_AMNT"
    t.text     "FNTI_NEW"
    t.text     "FNTI_4_11"
    t.decimal  "TTIC_AMNT"
    t.decimal  "WLTIC_AMNT"
    t.decimal  "PRIOR_AMNT"
    t.datetime "created_at", default: '2016-09-12 00:00:00', null: false
    t.datetime "updated_at", default: '2016-09-12 00:00:00', null: false
  end

end
