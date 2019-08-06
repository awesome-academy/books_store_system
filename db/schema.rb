ActiveRecord::Schema.define(version: 2019_08_06_065949) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "num_product"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "deliver_status"
    t.float "total_price"
    t.string "receiver"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.string "publisher_name"
    t.string "author_name"
    t.float "price"
    t.string "picture"
    t.integer "num_exist"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["title"], name: "index_products_on_title", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.text "content"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "avatar"
    t.string "phone"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
