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

ActiveRecord::Schema[7.2].define(version: 2024_08_25_084015) do
  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 16, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_wallet_id", null: false
    t.integer "destination_wallet_id", null: false
    t.decimal "source_cumulative_balance", precision: 16, scale: 2
    t.index ["destination_wallet_id"], name: "index_transactions_on_destination_wallet_id"
    t.index ["source_wallet_id"], name: "index_transactions_on_source_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", precision: 16, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
  end

  add_foreign_key "transactions", "wallets", column: "destination_wallet_id"
  add_foreign_key "transactions", "wallets", column: "source_wallet_id"
end
