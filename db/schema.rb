ActiveRecord::Schema.define(version: 20150622193029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "body"
    t.integer  "user_id"
    t.integer  "roast_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roasts", force: :cascade do |t|
    t.string   "roast_level"
    t.string   "roast_type"
    t.string   "coffee_name"
    t.string   "roaster"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
