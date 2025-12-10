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

ActiveRecord::Schema[8.1].define(version: 2025_12_10_075021) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "unaccent"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activity_histories", id: false, force: :cascade do |t|
    t.integer "activity_name"
    t.integer "activity_trackable_id"
    t.string "activity_trackable_type", limit: 255
    t.datetime "created_at", precision: nil
    t.string "description"
    t.string "files", limit: 255
    t.serial "id", null: false
    t.float "sell_through"
    t.datetime "updated_at", precision: nil
    t.jsonb "value"
  end

  create_table "activity_logs", id: false, force: :cascade do |t|
    t.text "activity", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "addresses", id: false, force: :cascade do |t|
    t.text "address1", default: ""
    t.text "address2", default: ""
    t.integer "address_type"
    t.string "city", limit: 255, default: ""
    t.string "company", limit: 255, default: ""
    t.string "country", limit: 255, default: ""
    t.string "country_code", limit: 255, default: ""
    t.datetime "created_at", precision: nil
    t.integer "customer_id"
    t.boolean "default_address", default: false
    t.string "email", default: ""
    t.string "first_name", limit: 255, default: ""
    t.serial "id", null: false
    t.boolean "in_address_book", default: false
    t.string "last_name", limit: 255, default: ""
    t.string "name", limit: 255, default: ""
    t.integer "order_id"
    t.string "phone", limit: 255, default: ""
    t.string "province", limit: 255, default: ""
    t.string "state"
    t.datetime "updated_at", precision: nil
    t.string "zip", limit: 255, default: ""
    t.string "zone", default: ""
    t.integer "zone_number"
  end

  create_table "ahoy_events", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "name"
    t.boolean "non_interact", default: false
    t.string "persona"
    t.jsonb "properties"
    t.datetime "time", precision: nil
    t.bigint "user_id"
    t.bigint "visit_id"
  end

  create_table "ahoy_visits", id: false, force: :cascade do |t|
    t.string "app_version"
    t.string "browser"
    t.jsonb "cart_data", default: {}
    t.jsonb "checkout_data", default: {}
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.string "customer_session_id"
    t.string "device_type"
    t.datetime "end_time", precision: nil
    t.integer "hits_count", default: 0
    t.bigserial "id", null: false
    t.string "ip"
    t.text "landing_page"
    t.float "latitude"
    t.float "longitude"
    t.string "marker"
    t.string "medium"
    t.integer "order_id"
    t.string "os"
    t.string "os_version"
    t.integer "person_id"
    t.integer "person_merged_type", default: 0
    t.string "platform"
    t.text "referrer"
    t.string "referring_domain"
    t.string "region"
    t.string "resolution"
    t.string "session_id"
    t.string "source_type"
    t.datetime "start_time", precision: nil
    t.datetime "started_at", precision: nil
    t.datetime "updated_at", precision: nil, null: false
    t.text "user_agent"
    t.bigint "user_id"
    t.string "utm_campaign"
    t.string "utm_content"
    t.string "utm_medium"
    t.string "utm_source"
    t.string "utm_term"
    t.string "visit_token"
    t.string "visitor_token"
  end

  create_table "app_settings", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.string "key", limit: 200, null: false
    t.datetime "updated_at", precision: nil
    t.json "value"
  end

  create_table "authorizations", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.serial "id", null: false
    t.string "name"
    t.string "provider"
    t.string "secret"
    t.string "token"
    t.string "uid"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "auto_discount_conditions", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "discount_code_id"
    t.string "display_icon", default: ""
    t.string "display_label", default: ""
    t.serial "id", null: false
    t.integer "position", default: 1
    t.string "product_tag", default: "", null: false
    t.string "product_tags", default: [], array: true
    t.integer "quantity", default: 0, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "auto_discounts", id: false, force: :cascade do |t|
    t.integer "auto_discount_code_id"
    t.datetime "created_at", precision: nil, null: false
    t.float "discounted_value", null: false
    t.serial "id", null: false
    t.integer "order_receipt_id"
    t.float "price", null: false
    t.integer "product_variant_id"
    t.integer "quantity", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bi_collection_analytics", id: false, force: :cascade do |t|
    t.integer "app_views", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.bigint "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "url_redirect_views", default: 0
    t.integer "web_views", default: 0
  end

  create_table "bi_product_analytics", id: false, force: :cascade do |t|
    t.integer "app_views", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "product_id", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.integer "url_redirect_views", default: 0
    t.integer "web_views", default: 0
  end

  create_table "bi_statistics", id: false, force: :cascade do |t|
    t.float "bounce_rate", default: 0.0
    t.float "collection_view", default: 0.0
    t.float "conversion_rate", default: 0.0
    t.datetime "created_at", precision: nil, null: false
    t.integer "defective_items_quantity", default: 0
    t.float "defective_items_value", default: 0.0
    t.integer "deliveries", default: 0
    t.float "discount", default: 0.0
    t.jsonb "frontend_shipping_duration"
    t.integer "ga_traffic", default: 0
    t.float "gross_revenue", default: 0.0
    t.serial "id", null: false
    t.integer "late_delivery", default: 0
    t.integer "live_skus", default: 0
    t.integer "missing_items_quantity", default: 0
    t.float "missing_items_value", default: 0.0
    t.integer "nps_detractors", default: 0
    t.integer "nps_promoters", default: 0
    t.integer "nps_quantity", default: 0
    t.integer "oos", default: 0
    t.integer "orders", default: 0
    t.float "page_depth", default: 0.0
    t.integer "product_view", default: 0
    t.integer "qty_sold", default: 0
    t.float "rating", default: 0.0
    t.float "revenue", default: 0.0
    t.float "site_speed", default: 0.0
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "views_by_device"
  end

  create_table "bi_url_redirect_analytics", id: false, force: :cascade do |t|
    t.integer "app_views", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "url_redirect_id"
    t.integer "web_views", default: 0
  end

  create_table "bi_variants", id: false, force: :cascade do |t|
    t.jsonb "adjusted_prices", default: {}
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.integer "margin"
    t.integer "product_variant_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bulkorder_forms", id: false, force: :cascade do |t|
    t.json "attachments"
    t.string "business_type", default: ""
    t.string "company_address"
    t.string "company_name"
    t.string "contact_number"
    t.datetime "created_at", precision: nil, null: false
    t.string "customer_name"
    t.text "details"
    t.string "email"
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cancel_order_line_items", id: false, force: :cascade do |t|
    t.integer "cancelled_type", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "more_reason", default: 0
    t.integer "num_arrived", default: 0
    t.integer "num_dropship", default: 0
    t.integer "num_new", default: 0
    t.integer "num_ordered", default: 0
    t.integer "num_retrieve", default: 0
    t.integer "order_line_item_id"
    t.integer "quantity", default: 0
    t.integer "reason"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "catalog_archetype_group_one_settings", id: false, force: :cascade do |t|
    t.integer "handover_duration"
    t.bigint "hipvan_buyer_id"
    t.bigserial "id", null: false
    t.string "product_archetype_group_1"
  end

  create_table "catalog_brands", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.integer "hidden_product_count", default: 0
    t.serial "id", null: false
    t.string "name"
    t.integer "product_count", default: 0
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil
    t.integer "visible_product_count", default: 0
  end

  create_table "catalog_bundle_items", id: false, force: :cascade do |t|
    t.boolean "assembly_inclusive", default: false
    t.integer "bundle_variant_id"
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "item_variant_id"
    t.integer "position"
    t.integer "quantity"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_buyer_bundles", id: false, force: :cascade do |t|
    t.integer "buyer_id"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_colours", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "name", null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "value", null: false
  end

  create_table "catalog_complementary_taxons", id: false, force: :cascade do |t|
    t.integer "complementary_taxon_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.integer "display_interval", default: 4
    t.serial "id", null: false
    t.integer "position", null: false
    t.integer "source_taxon_id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_country_pricings", id: false, force: :cascade do |t|
    t.decimal "compare_at_price"
    t.decimal "cost_price"
    t.string "country_code"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "invoice_currency"
    t.decimal "invoice_price"
    t.decimal "price"
    t.integer "product_variant_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_customer_home_images", id: false, force: :cascade do |t|
    t.text "alt_text", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.integer "height"
    t.serial "id", null: false
    t.string "md5_digest"
    t.integer "position", null: false
    t.integer "product_id"
    t.text "src", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.integer "width"
  end

  create_table "catalog_dimension_images", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.integer "position"
    t.integer "product_id"
    t.string "s3_key"
    t.string "src"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_discount_alerts", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "discount_code_id"
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "position"
    t.string "sale_heading", default: ""
    t.string "term_conditions", default: ""
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_gift_cards", id: false, force: :cascade do |t|
    t.datetime "applied_at", precision: nil
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "ends_at", precision: nil
    t.serial "id", null: false
    t.integer "order_id"
    t.integer "price", default: 0
    t.integer "status"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_import_duties", id: false, force: :cascade do |t|
    t.string "country_code"
    t.datetime "created_at", precision: nil, null: false
    t.decimal "duty_percentage"
    t.serial "id", null: false
    t.string "port"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_link_lists", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "handle", limit: 255
    t.serial "id", null: false
    t.string "title", limit: 255
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_links", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "link_list_id"
    t.string "link_type", limit: 255
    t.integer "position"
    t.integer "subject_id"
    t.string "subject_type", limit: 255
    t.string "title", limit: 255
    t.datetime "updated_at", precision: nil
    t.string "value", limit: 255
  end

  create_table "catalog_maps", id: false, force: :cascade do |t|
    t.integer "catalog_id"
    t.datetime "created_at", precision: nil
    t.integer "hiptruck_id"
    t.string "hiptruck_type", limit: 255
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_parcels", id: false, force: :cascade do |t|
    t.integer "courier_id"
    t.datetime "created_at", precision: nil, null: false
    t.string "export_label"
    t.float "height"
    t.serial "id", null: false
    t.float "length"
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", precision: nil, null: false
    t.float "weight"
    t.float "width"
  end

  create_table "catalog_partner_form_product_rows", id: false, force: :cascade do |t|
    t.text "collection_json"
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.text "partner_json"
    t.integer "product_id"
    t.text "product_json"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_price_adjustments", id: false, force: :cascade do |t|
    t.datetime "adjust_end_at", precision: nil
    t.datetime "adjust_start_at", precision: nil
    t.decimal "adjusted_cost_price"
    t.decimal "adjusted_invoice_price"
    t.decimal "adjusted_promo_price"
    t.decimal "adjusted_regular_price"
    t.decimal "adjusted_retail_price"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.float "final_margin", default: 0.0
    t.bigserial "id", null: false
    t.bigint "product_id"
    t.bigint "product_variant_id"
    t.decimal "rollback_cost_price"
    t.decimal "rollback_invoice_price"
    t.decimal "rollback_promo_price"
    t.decimal "rollback_regular_price"
    t.decimal "rollback_retail_price"
    t.integer "sold_qty", default: 0
    t.integer "status", default: 0
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_answers", id: false, force: :cascade do |t|
    t.string "agent_email"
    t.integer "agent_id"
    t.string "agent_name"
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.integer "created_by", default: 0
    t.text "display_body"
    t.datetime "display_date", precision: nil
    t.text "html_body"
    t.serial "id", null: false
    t.integer "product_question_id"
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "zendesk_id"
  end

  create_table "catalog_product_archetype_groups", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "created_by", default: 49
    t.integer "facebook_taxonomy_id", default: 0
    t.integer "general_care_option_id"
    t.integer "google_taxonomy_id", default: 0
    t.bigserial "id", null: false
    t.string "product_archetype"
    t.string "product_archetype_group_1"
    t.string "product_archetype_group_2"
    t.integer "products_count", default: 0
    t.string "root_custom_label"
    t.string "sub_custom_label"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_changes", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "event_type"
    t.serial "id", null: false
    t.string "new_value"
    t.string "old_value"
    t.integer "product_id"
    t.integer "product_variant_id"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "catalog_product_countries", id: false, force: :cascade do |t|
    t.string "country_code", default: ""
    t.string "country_name", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_documents", id: false, force: :cascade do |t|
    t.integer "concern", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.string "link"
    t.string "name"
    t.bigint "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_extras", id: false, force: :cascade do |t|
    t.string "additional_taxes", limit: 255
    t.datetime "created_at", precision: nil
    t.string "currency", limit: 255
    t.string "hipvan_commission", limit: 255
    t.serial "id", null: false
    t.string "moq_for_wholesale_price", limit: 255
    t.integer "product_id"
    t.text "remarks"
    t.string "shipping_fees", limit: 255
    t.string "shipping_option", limit: 255
    t.datetime "updated_at", precision: nil
    t.string "wholesale_price", limit: 255
  end

  create_table "catalog_product_family_tags", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "hidden_bundles_count", default: 0
    t.integer "hidden_count", default: 0
    t.bigserial "id", null: false
    t.string "name"
    t.string "parameterized_name"
    t.integer "products_count", default: 0
    t.integer "published_bundles_count", default: 0
    t.integer "published_count", default: 0
    t.bigint "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_images", id: false, force: :cascade do |t|
    t.text "alt_text"
    t.text "colors", default: ""
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.string "description", default: ""
    t.integer "height"
    t.serial "id", null: false
    t.boolean "is_shopping_feed", default: false
    t.string "md5_digest"
    t.boolean "migrated", default: false
    t.string "photo_type_label"
    t.integer "position"
    t.integer "product_id"
    t.text "s3_src", default: ""
    t.text "seo_keywords"
    t.text "src"
    t.boolean "synced_to_s3", default: false
    t.datetime "updated_at", precision: nil
    t.integer "width"
  end

  create_table "catalog_product_info_sheets", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "desktop_description", default: ""
    t.text "desktop_image_url", default: ""
    t.bigserial "id", null: false
    t.text "mobile_description", default: ""
    t.text "mobile_image_url", default: ""
    t.integer "position", null: false
    t.bigint "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_options", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "custom_option", limit: 255
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.integer "option_id"
    t.integer "position"
    t.integer "product_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_product_properties", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.integer "product_id"
    t.integer "property_id"
    t.datetime "updated_at", precision: nil
    t.text "value"
  end

  create_table "catalog_product_question_attachments", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "product_question_id"
  end

  create_table "catalog_product_questions", id: false, force: :cascade do |t|
    t.text "assistance_internal_note"
    t.integer "assistance_status"
    t.datetime "created_at", precision: nil, null: false
    t.integer "created_by", default: 0
    t.string "customer_email", null: false
    t.string "customer_name", null: false
    t.text "description"
    t.string "display_customer_name"
    t.datetime "display_date", precision: nil
    t.text "display_description"
    t.datetime "fetched_at", precision: nil
    t.serial "id", null: false
    t.datetime "last_published_at", precision: nil
    t.datetime "manual_fetched_at", precision: nil
    t.integer "priority", limit: 2, null: false
    t.integer "product_id"
    t.integer "status", limit: 2
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "visible", default: true
    t.bigint "zendesk_id"
    t.integer "zendesk_state", limit: 2, null: false
  end

  create_table "catalog_product_reorders", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.datetime "last_visible", precision: nil
    t.integer "product_variant_id"
    t.integer "remaining_stock", default: 0
    t.integer "sold_quantity", default: 0
    t.datetime "started_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "visible_days", default: 0
  end

  create_table "catalog_product_rich_details", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.text "description", default: ""
    t.text "header", default: ""
    t.serial "id", null: false
    t.text "image_url", default: ""
    t.integer "position", null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_product_stock_partner_histories", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "file_name", default: ""
    t.integer "hipvan_partner_id"
    t.serial "id", null: false
    t.integer "status"
    t.string "status_detail", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "catalog_product_taxons", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.boolean "manual", default: false
    t.boolean "native", default: true, null: false
    t.integer "position"
    t.integer "product_id"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_product_variant_cartons", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "cubic_metres", limit: 50, default: ""
    t.string "depth", limit: 50, default: ""
    t.string "height", limit: 50, default: ""
    t.serial "id", null: false
    t.string "label", default: ""
    t.string "length", limit: 50, default: ""
    t.integer "number_of_cartons", default: 0
    t.integer "product_variant_id", null: false
    t.datetime "updated_at", precision: nil
    t.string "width", limit: 50, default: ""
  end

  create_table "catalog_product_variant_oos_logs", id: false, force: :cascade do |t|
    t.boolean "allow_inventory_sync"
    t.float "as1"
    t.datetime "created_at", precision: nil, null: false
    t.integer "delivery_method"
    t.datetime "end_at", precision: nil
    t.serial "id", null: false
    t.integer "inventory_stock"
    t.integer "product_variant_tracking_id"
    t.float "revenue_loss", default: 0.0
    t.float "selling_price"
    t.integer "stock"
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "visible"
  end

  create_table "catalog_product_variant_option_values", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "product_option_id"
    t.integer "product_variant_id"
    t.datetime "updated_at", precision: nil
    t.string "value", limit: 255
  end

  create_table "catalog_product_variant_trackings", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "description"
    t.datetime "end_at", precision: nil
    t.serial "id", null: false
    t.integer "product_variant_id"
    t.datetime "start_at", precision: nil
    t.integer "tracking_type", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.boolean "visible", default: true
  end

  create_table "catalog_product_variants", id: false, force: :cascade do |t|
    t.integer "actual_order", default: 0
    t.integer "add_carts_count", default: 0
    t.boolean "archived", default: false
    t.integer "assembly", default: 0
    t.boolean "assembly_inclusive_option", default: false
    t.string "assembly_note"
    t.string "avg_frontend_shipping_duration"
    t.decimal "backup_price"
    t.string "colour_key", default: ""
    t.string "colour_key_2", default: ""
    t.string "colour_key_3", default: ""
    t.decimal "compare_at_price"
    t.boolean "contribute_to_restocking_group", default: true
    t.decimal "cost_price", precision: 12, scale: 2
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.boolean "dropshipped", default: false
    t.boolean "for_rescue", default: false
    t.datetime "frontend_shipping_date", precision: nil
    t.text "full_name"
    t.float "grams"
    t.integer "gross_weight"
    t.serial "id", null: false
    t.float "imminent_revenue_loss", default: 0.0
    t.string "invoice_currency", limit: 255
    t.decimal "invoice_price", precision: 12, scale: 2
    t.decimal "invoice_price_in_sgd", precision: 12, scale: 2
    t.float "last_changed_price"
    t.float "last_changed_promo_price"
    t.datetime "live_date", precision: nil
    t.integer "manual_average_s30"
    t.string "merchant_sku", limit: 255
    t.string "merchant_sku_2", default: ""
    t.string "merchant_sku_3", default: ""
    t.integer "month_multiplier_id"
    t.integer "moq", default: 1
    t.integer "original_variant_id"
    t.integer "packing_quantity", default: 1
    t.datetime "partner_in_stock_availability_date", precision: nil
    t.jsonb "po_data"
    t.integer "position"
    t.decimal "price", precision: 12, scale: 2, default: "0.0"
    t.integer "product_id"
    t.integer "product_image_id"
    t.decimal "promo_price"
    t.integer "recombee_weekly_ranking"
    t.integer "restocking_group_id"
    t.text "shelf_number"
    t.integer "simplified_stock_lead_time"
    t.string "sku", limit: 255
    t.integer "stock"
    t.datetime "sync_inventory_date", precision: nil
    t.decimal "unit_cbm"
    t.datetime "updated_at", precision: nil
    t.string "variant_archetype", default: ""
    t.integer "warehouse_location_id"
    t.integer "wholesale_assembly", default: 0
  end

  create_table "catalog_products", id: false, force: :cascade do |t|
    t.integer "add_carts_count", default: 0
    t.boolean "allow_inventory_sync", default: false
    t.string "archetype_group_1"
    t.string "archetype_group_2"
    t.integer "attr_labels_1_count", default: 0
    t.integer "attr_labels_2_count", default: 0
    t.string "attr_labels_2_primary", default: ""
    t.text "body_html"
    t.integer "brand_id"
    t.string "country_code", limit: 255, default: "sg"
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.integer "delivery_duration_in_minutes", default: 0
    t.integer "delivery_method"
    t.text "description"
    t.integer "estimated_partner_arrival_day", default: 0
    t.string "family_tag"
    t.integer "ga_page_views", default: 0
    t.string "group", default: ""
    t.string "handle", limit: 255
    t.datetime "hidden_at", precision: nil
    t.boolean "highlight_bundle_price", default: true
    t.serial "id", null: false
    t.integer "images_count", default: 0
    t.date "incoming_eta"
    t.boolean "is_dropped", default: false
    t.boolean "is_reorder", default: true
    t.boolean "is_set", default: false
    t.text "more_details"
    t.string "name", limit: 255
    t.boolean "old_version", default: false
    t.integer "order_frequency", default: 0
    t.integer "original_product_id"
    t.integer "primary_category_id", default: 0
    t.string "product_category"
    t.string "product_type", limit: 255
    t.datetime "published_at", precision: nil
    t.integer "purchase_group_id"
    t.integer "purchase_group_position", default: 0
    t.integer "redeemable_points"
    t.string "remarks", default: ""
    t.boolean "reviewable", default: true
    t.text "rich_content", default: ""
    t.boolean "rich_content_enabled", default: false
    t.string "shipping_duration", limit: 255
    t.text "short_description"
    t.boolean "show_alternative_colours", default: false
    t.boolean "show_on_collection", default: true
    t.string "sku", limit: 255
    t.integer "stock_lead_time", default: 0
    t.string "stock_lead_time_sync_note", default: ""
    t.string "style_recommendation_description", default: ""
    t.boolean "style_recommendation_enabled", default: false
    t.text "tags"
    t.datetime "updated_at", precision: nil
    t.integer "vendor_id"
    t.text "video"
    t.jsonb "video_info"
    t.integer "video_position"
  end

  create_table "catalog_promo_banners", id: false, force: :cascade do |t|
    t.string "background_colour", default: "#35D0BA"
    t.string "banner_image"
    t.string "campaign"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "end_time", precision: nil
    t.bigserial "id", null: false
    t.boolean "published", default: false
    t.datetime "start_time", precision: nil
    t.datetime "updated_at", precision: nil, null: false
    t.string "url"
  end

  create_table "catalog_qna_linked_products", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "product_id"
    t.integer "product_question_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_related_taxons", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "position", null: false
    t.integer "related_taxon_id", null: false
    t.integer "source_taxon_id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_remark_configs", id: false, force: :cascade do |t|
    t.integer "char_limit"
    t.datetime "created_at", precision: nil, null: false
    t.string "font_sample_img"
    t.bigserial "id", null: false
    t.bigint "product_variant_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_review_images", id: false, force: :cascade do |t|
    t.string "alt_text"
    t.datetime "created_at", precision: nil, null: false
    t.integer "height"
    t.serial "id", null: false
    t.integer "position", default: 0
    t.integer "review_id"
    t.integer "review_image_type", default: 1, null: false
    t.string "s3_key"
    t.string "src"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "width"
  end

  create_table "catalog_reviews", id: false, force: :cascade do |t|
    t.text "body_html"
    t.datetime "created_at", precision: nil, null: false
    t.string "email", default: ""
    t.integer "followup_status"
    t.serial "id", null: false
    t.string "name"
    t.integer "nps_rating"
    t.integer "order_id"
    t.integer "position", default: 0
    t.decimal "rating"
    t.datetime "reviewed_at", precision: nil
    t.integer "source", default: 3
    t.string "source_id"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "visibility", default: 0
  end

  create_table "catalog_rich_contents", id: false, force: :cascade do |t|
    t.text "body_html", default: ""
    t.integer "catalog_rich_content_id"
    t.string "catalog_rich_content_type"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "position", default: -1
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_sale_banners", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.string "image_url"
    t.string "link_url"
    t.string "mobile_image_url"
    t.boolean "status", default: true
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_smart_rules", id: false, force: :cascade do |t|
    t.string "column", limit: 255
    t.string "condition", limit: 255
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.string "relation", limit: 255
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_style_recommendation_products", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "position", null: false
    t.integer "recommended_product_id", null: false
    t.integer "source_product_id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_taxon_descriptions", id: false, force: :cascade do |t|
    t.integer "complement_banners_count", default: 0
    t.datetime "created_at", precision: nil
    t.integer "header_banners_count", default: 0
    t.serial "id", null: false
    t.string "image_background_color"
    t.text "image_src"
    t.text "long_description"
    t.string "mobile_image_src"
    t.string "quote_by", limit: 255
    t.text "quote_image_src"
    t.text "quote_intro"
    t.text "s3_image_src", default: ""
    t.text "s3_quote_image_src", default: ""
    t.text "short_description"
    t.boolean "synced_to_s3", default: false
    t.integer "taxon_id"
    t.integer "template_id"
    t.datetime "updated_at", precision: nil
    t.integer "vendor_id"
    t.text "video"
  end

  create_table "catalog_taxon_filter_options", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "filter_product_width_gap", default: 50
    t.string "filter_product_width_label"
    t.serial "id", null: false
    t.boolean "show_product_width_filter", default: false
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_taxon_images", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.integer "height"
    t.serial "id", null: false
    t.text "s3_src", default: ""
    t.text "src"
    t.boolean "src_changed"
    t.boolean "synced_to_s3", default: false
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil
    t.integer "width"
  end

  create_table "catalog_taxon_publish_flags", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.boolean "products_reordered"
    t.text "removed_product_ids"
    t.boolean "rules_changed"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "catalog_taxon_rich_contents", id: false, force: :cascade do |t|
    t.text "body_html", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "position", default: -1
    t.integer "taxon_id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "catalog_taxons", id: false, force: :cascade do |t|
    t.text "banner_url"
    t.text "body_html"
    t.integer "category_id"
    t.string "complement_desktop_banner_src"
    t.string "complement_mobile_banner_src"
    t.datetime "created_at", precision: nil
    t.integer "days_until_autoremove", default: 60
    t.string "default_sort"
    t.datetime "deleted_at", precision: nil
    t.integer "family_tag_id"
    t.integer "freeze_at_product_count", default: 90
    t.string "handle", limit: 255
    t.datetime "hidden_at", precision: nil
    t.string "icon_classname"
    t.serial "id", null: false
    t.integer "master_taxon_id"
    t.integer "menu_rich_content_cols", default: 0
    t.text "menu_rich_content_html", default: ""
    t.string "name", limit: 255
    t.boolean "nav_block_fit", default: false
    t.boolean "only_show_menu_rich_content", default: false
    t.integer "page_views", default: 0
    t.integer "position"
    t.boolean "product_changed_status", default: false
    t.decimal "product_page_views_percentage", default: "-1.0"
    t.datetime "published_at", precision: nil
    t.text "rich_content_body_html", default: ""
    t.integer "rich_content_position", default: -1
    t.boolean "rules_disjunctive"
    t.string "sort_order", limit: 255
    t.jsonb "sorted_products_data", default: {}
    t.boolean "sorting_in_progress", default: false
    t.boolean "suggestable", default: true
    t.integer "taxon_type"
    t.datetime "updated_at", precision: nil
    t.boolean "visible_nav_node", default: true
  end

  create_table "catalog_variant_images", id: false, force: :cascade do |t|
    t.text "alt_text"
    t.datetime "created_at", precision: nil, null: false
    t.float "height"
    t.bigserial "id", null: false
    t.text "key"
    t.bigint "product_variant_id"
    t.text "src"
    t.datetime "updated_at", precision: nil, null: false
    t.float "width"
  end

  create_table "categories", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "handle", limit: 255
    t.serial "id", null: false
    t.integer "parent_id"
    t.integer "position"
    t.integer "source_id", default: 0
    t.string "source_type", default: "Catalog::Taxon"
    t.datetime "updated_at", precision: nil
  end

  create_table "category_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
  end

  create_table "cms_blogs", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.text "body_html", default: ""
    t.datetime "created_at", precision: nil
    t.string "handle", limit: 255, default: ""
    t.serial "id", null: false
    t.integer "last_updated_user_id"
    t.boolean "mobile", default: false
    t.datetime "published_at", precision: nil
    t.string "title", limit: 255, default: ""
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.integer "visibility", default: 0
  end

  create_table "cms_carousel_items", id: false, force: :cascade do |t|
    t.integer "carousel_id"
    t.datetime "created_at", precision: nil, null: false
    t.string "destination_url", limit: 1000, default: ""
    t.datetime "end_time", precision: nil
    t.serial "id", null: false
    t.string "image_alt"
    t.string "image_url", limit: 1000, default: ""
    t.integer "position"
    t.datetime "start_time", precision: nil
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_type", default: 0
  end

  create_table "cms_carousel_medium", id: false, force: :cascade do |t|
    t.text "alt_text"
    t.bigint "carousel_item_id"
    t.string "content_type"
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.text "link_url"
    t.float "max_height"
    t.float "max_width"
    t.string "media_type"
    t.text "media_url"
    t.string "name"
    t.string "playback_id"
    t.integer "status", default: 0, null: false
    t.text "thumbnail_url"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cms_carousels", id: false, force: :cascade do |t|
    t.boolean "autoplayable", default: false
    t.integer "carousel_type", limit: 2, default: 1
    t.datetime "created_at", precision: nil, null: false
    t.integer "delay_time"
    t.integer "home_page_id"
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cms_files", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.text "filename"
    t.string "filetype", limit: 255
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
  end

  create_table "cms_home_pages", id: false, force: :cascade do |t|
    t.text "body_html"
    t.integer "carousel_id"
    t.datetime "created_at", precision: nil, null: false
    t.text "css_content", default: ""
    t.serial "id", null: false
    t.text "js_content", default: ""
    t.integer "latest_updated_user_id"
    t.string "name", default: ""
    t.boolean "status", default: false
    t.text "swiper_extra_html_content", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "cms_pages", id: false, force: :cascade do |t|
    t.string "app_path", default: ""
    t.text "body_html", default: ""
    t.text "body_html_for_mobile"
    t.integer "category_id", default: 0
    t.string "content_type"
    t.datetime "created_at", precision: nil
    t.text "css_content", default: ""
    t.string "handle", limit: 255, default: ""
    t.serial "id", null: false
    t.boolean "is_use_template", default: false
    t.text "js_content", default: ""
    t.integer "last_updated_user_id"
    t.string "name", limit: 255, default: ""
    t.datetime "published_at", precision: nil
    t.text "template_html"
    t.string "tracking_tag", default: ""
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
    t.boolean "visibility", default: false
  end

  create_table "cms_url_redirect_histories", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.datetime "last_updated_date", precision: nil
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
    t.integer "url_redirect_id", default: 0
  end

  create_table "cms_url_redirects", id: false, force: :cascade do |t|
    t.integer "app_views", default: 0
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.datetime "last_request_date", precision: nil
    t.datetime "last_updated_date", precision: nil
    t.string "new_url", limit: 255, default: ""
    t.string "old_url", limit: 255, default: ""
    t.integer "source_id", default: 0
    t.string "source_type", default: ""
    t.datetime "updated_at", precision: nil
    t.integer "web_views", default: 0
  end

  create_table "companies", id: false, force: :cascade do |t|
    t.string "address1", default: ""
    t.string "address2", default: ""
    t.string "business_nature", default: ""
    t.string "business_registration_number", default: ""
    t.string "city", default: ""
    t.string "company_name", default: ""
    t.string "country", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.string "email", default: ""
    t.serial "id", null: false
    t.string "phone_number", default: ""
    t.string "state", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "website", default: ""
    t.string "zip", default: ""
  end

  create_table "cost_factors", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.decimal "default_percentage"
    t.serial "id", null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "cp_community_content_products", id: false, force: :cascade do |t|
    t.integer "community_content_id"
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "variant_id"
  end

  create_table "cp_community_contents", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.json "data"
    t.bigserial "id", null: false
    t.string "source_id"
    t.integer "source_type"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "credit_histories", id: false, force: :cascade do |t|
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", precision: nil, null: false
    t.integer "credit_type"
    t.integer "customer_id"
    t.text "description", default: ""
    t.text "description_for_admin", default: ""
    t.datetime "expired_at", precision: nil
    t.serial "id", null: false
    t.integer "order_id"
    t.integer "status", default: -1
    t.datetime "updated_at", precision: nil, null: false
    t.integer "updated_by_id"
    t.string "updated_by_resource"
    t.float "valid_amount", default: 0.0
  end

  create_table "customer_companies", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.serial "id", null: false
    t.integer "role", default: 0
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "customer_devices", id: false, force: :cascade do |t|
    t.string "app_version"
    t.string "auth_user_id", default: ""
    t.integer "build_number"
    t.datetime "created_at", precision: nil
    t.integer "customer_id"
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.string "model"
    t.integer "os"
    t.string "os_version"
    t.integer "status", default: 0
    t.string "token"
    t.datetime "updated_at", precision: nil
  end

  create_table "customer_invoice_zips", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil
  end

  create_table "customer_pricing_tiers", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "customers_count", default: 0
    t.float "discount", default: 0.0, null: false
    t.serial "id", null: false
    t.string "name", limit: 250, default: "", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "customer_registered_out_of_stock_notifications", id: false, force: :cascade do |t|
    t.integer "catalog_product_variant_id"
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.boolean "has_sent_email_notification", default: false
    t.serial "id", null: false
    t.datetime "sent_email_time", precision: nil
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "customer_service_agents", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "email"
    t.serial "id", null: false
    t.boolean "is_primary", default: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "customer_wishlists", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.integer "customer_id"
    t.serial "id", null: false
    t.datetime "last_updated_at", precision: nil
    t.integer "privacy", default: 0
    t.datetime "retarget_email_sent", precision: nil
    t.string "shared_key"
    t.datetime "updated_at", precision: nil
  end

  create_table "customers", id: false, force: :cascade do |t|
    t.datetime "account_created_at", precision: nil
    t.string "additional_msg"
    t.string "auth_user_id", default: ""
    t.datetime "birthday", precision: nil
    t.string "business_nature", default: ""
    t.decimal "capture_credits_for_product_reviews", default: "0.0"
    t.string "cko_customer_id"
    t.string "cko_fingerprints", default: [], array: true
    t.string "coupon_code", default: ""
    t.datetime "created_at", precision: nil
    t.decimal "credits", default: "0.0"
    t.integer "customer_pricing_tier_id"
    t.datetime "deleted_at", precision: nil
    t.text "description"
    t.string "email", limit: 255
    t.jsonb "email_list_ids", default: []
    t.string "facebook_id", limit: 255
    t.string "first_name", limit: 255, default: ""
    t.integer "gender"
    t.json "homepage", default: {}
    t.string "homepage_str"
    t.serial "id", null: false
    t.string "image_url"
    t.boolean "is_bited", default: false
    t.boolean "is_cart_reminder", default: false
    t.boolean "is_product_review_reminder", default: false
    t.boolean "is_wishlist_reminder", default: false
    t.datetime "last_cart_reminder_end_at", precision: nil
    t.datetime "last_logged_in", precision: nil
    t.string "last_name", limit: 255, default: ""
    t.datetime "last_product_review_reminder_end_at", precision: nil
    t.datetime "last_wishlist_reminder_end_at", precision: nil
    t.integer "loyalty_points", default: 0
    t.string "nickname"
    t.jsonb "notifications_settings", default: {}
    t.integer "order_comments_count", default: 0
    t.integer "order_minimum_group_id"
    t.string "password_digest", limit: 255
    t.string "phone_number", default: ""
    t.integer "referral_goal_1", default: 0
    t.integer "referrer_id"
    t.boolean "request_store_review", default: false
    t.boolean "requested_update_info", default: false
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token", limit: 255
    t.string "reviewer_name", default: ""
    t.datetime "sent_approve_email_at", precision: nil
    t.bigint "shopify_id"
    t.string "shopify_state", limit: 255, default: "disabled"
    t.string "slug"
    t.jsonb "socials", default: {}
    t.integer "source"
    t.string "source_channel", default: "hipvan"
    t.string "source_device_category"
    t.string "source_path"
    t.integer "status", default: 0
    t.string "stripe_customer_id"
    t.boolean "subscribe_lifecycle_emails", default: true
    t.boolean "subscribe_transaction_emails", default: true
    t.boolean "suspended", default: false
    t.string "tctp_card_tokens", default: [], array: true
    t.integer "tier_type", default: 0
    t.string "token"
    t.string "uid"
    t.string "unicode_nickname"
    t.datetime "unsubscribed_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "daily_count_variants", id: false, force: :cascade do |t|
    t.datetime "counted_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "inventory_id"
    t.integer "new_inventory_stock"
    t.integer "old_inventory_stock"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "discount_codes", id: false, force: :cascade do |t|
    t.boolean "applies_once", default: false
    t.integer "applies_to_device", default: 0
    t.integer "applies_to_id"
    t.string "applies_to_resource", limit: 255
    t.string "code", limit: 255
    t.jsonb "collection_ids", default: []
    t.datetime "created_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.integer "discount_type"
    t.datetime "ends_at", precision: nil
    t.string "group_name", limit: 255
    t.serial "id", null: false
    t.boolean "include_free_shipping", default: false
    t.boolean "is_auto_conditions", default: false
    t.boolean "logged_customers_in_only", default: false
    t.float "minimum_order_amount", default: 0.0
    t.string "name"
    t.boolean "new_customers_only", default: false
    t.string "note", limit: 255, default: ""
    t.boolean "one_discount_per_customer", default: false
    t.boolean "one_discount_per_customer_per_year", default: false
    t.integer "position", default: 1
    t.integer "sent_to_id"
    t.string "sent_to_resource"
    t.jsonb "show_on_collection_ids", default: []
    t.datetime "starts_at", precision: nil
    t.integer "status"
    t.integer "times_used", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.integer "usage_limit"
    t.integer "user_id"
    t.jsonb "value"
  end

  create_table "email_trackings", id: false, force: :cascade do |t|
    t.string "cc_emails", default: [], array: true
    t.integer "clicks_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.string "delivery_response_status"
    t.string "from_email", default: ""
    t.serial "id", null: false
    t.datetime "last_event_time", precision: nil
    t.jsonb "mailer_params", default: {}
    t.integer "mailer_type", default: 0
    t.string "msg_id", default: ""
    t.integer "opens_count", default: 0
    t.integer "resource_id"
    t.string "resource_type"
    t.string "send_func_name"
    t.string "status", default: ""
    t.string "subject", default: ""
    t.string "to_email", default: ""
    t.integer "tracking_type", default: 0
    t.string "trigger_source"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "free_deliveries", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "delivery_option", default: 0
    t.integer "device_type", default: 0
    t.datetime "end_at", precision: nil
    t.serial "id", null: false
    t.decimal "minimum_spend", default: "0.0"
    t.integer "order_type", default: 0
    t.datetime "start_at", precision: nil
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "general_care_options", id: false, force: :cascade do |t|
    t.string "case"
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.integer "priority"
    t.datetime "updated_at", precision: nil, null: false
    t.text "writeup"
  end

  create_table "hipvan_buyers", id: false, force: :cascade do |t|
    t.string "cc_emails", default: ""
    t.datetime "created_at", precision: nil
    t.string "email", limit: 255
    t.serial "id", null: false
    t.string "image_url", limit: 1000, default: ""
    t.text "late_order_emails", default: ""
    t.string "name", limit: 255
    t.string "name_normalize", limit: 255
    t.datetime "updated_at", precision: nil
  end

  create_table "hipvan_partner_accounts", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "email"
    t.integer "hipvan_partner_id"
    t.serial "id", null: false
    t.boolean "is_primary", default: false
    t.string "roles", default: [], array: true
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
  end

  create_table "hipvan_partners", id: false, force: :cascade do |t|
    t.text "address"
    t.float "agent_fee_percent", default: 0.0
    t.boolean "allow_edit_front_end_stock", default: false
    t.string "contact_number", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.integer "hipvan_buyer_id"
    t.serial "id", null: false
    t.boolean "is_reorder", default: true
    t.string "mlm", limit: 255, default: "MLM"
    t.string "name", limit: 255
    t.string "name_normalize", limit: 255
    t.text "note"
    t.integer "partner_currency_id"
    t.integer "partner_id"
    t.integer "partner_model_id"
    t.text "partner_payment_details"
    t.integer "partner_payment_method_id"
    t.integer "partner_payment_term_id"
    t.integer "partner_shipping_method_id"
    t.string "partner_type"
    t.string "person_name", limit: 255
    t.datetime "updated_at", precision: nil
    t.string "website_link", limit: 255
  end

  create_table "hipvan_vendors", id: false, force: :cascade do |t|
    t.string "address", default: ""
    t.integer "create_po_mode", default: 0
    t.datetime "created_at", precision: nil
    t.integer "custom_shipping_mark", default: 0
    t.datetime "deleted_at", precision: nil
    t.string "export_country", default: ""
    t.integer "hipvan_partner_id"
    t.serial "id", null: false
    t.integer "lead_time"
    t.integer "minimum_order_cbm_type", default: 1
    t.string "name", limit: 255
    t.string "name_normalize", limit: 255
    t.boolean "need_sync_selling_stock", default: false
    t.integer "order_frequency", default: 0
    t.jsonb "po_days", default: [1, 2, 3, 4, 5]
    t.string "shipping_port", default: ""
    t.datetime "updated_at", precision: nil
    t.integer "warranty", default: 0
  end

  create_table "html_generations", id: false, force: :cascade do |t|
    t.text "body_html"
    t.datetime "created_at", precision: nil
    t.string "handle", limit: 255
    t.serial "id", null: false
    t.text "merchant_sku"
    t.decimal "po_price", default: "0.0"
    t.text "product_json"
    t.string "shopify_product_id", limit: 255
    t.string "unique_identifier", limit: 255
    t.datetime "updated_at", precision: nil
    t.string "variant_sku", limit: 255
  end

  create_table "inventories", id: false, force: :cascade do |t|
    t.integer "consigned", default: 0
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "intake", default: 0
    t.integer "intake_dup"
    t.integer "ordered", default: 0
    t.integer "product_variant_id"
    t.integer "spare", default: 0
    t.integer "stock", default: 0
    t.datetime "updated_at", precision: nil
  end

  create_table "ios_homepage_settings", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url"
    t.integer "setting_type", default: 0
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ios_snippet_blogs", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "ios_snippet_id"
    t.integer "position", default: 0
    t.string "text", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
  end

  create_table "ios_snippet_products", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "ios_snippet_id"
    t.integer "position", default: 0
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ios_snippet_reviews", id: false, force: :cascade do |t|
    t.string "copy", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "ios_snippet_id"
    t.integer "position", default: 0
    t.string "title", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
  end

  create_table "ios_snippet_taxons", id: false, force: :cascade do |t|
    t.string "caption", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url"
    t.integer "ios_snippet_id"
    t.integer "position"
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
  end

  create_table "ios_snippets", id: false, force: :cascade do |t|
    t.string "caption", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.string "cta_text", default: ""
    t.datetime "deleted_at", precision: nil
    t.integer "display_mode", default: 0
    t.datetime "end_time", precision: nil
    t.integer "height"
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.boolean "is_full_width", default: true
    t.boolean "is_hide_caption", default: false
    t.integer "master_id"
    t.integer "number_items_per_row"
    t.integer "platform", default: 0
    t.integer "position", default: 0
    t.integer "snippet_type", default: 0
    t.datetime "start_time", precision: nil
    t.integer "taxon_id"
    t.string "text", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
    t.integer "width"
  end

  create_table "item_sales_channels", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "sales_channel_id"
    t.integer "source_id"
    t.string "source_type"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "loyalty_point_histories", id: false, force: :cascade do |t|
    t.string "approved_action_id", default: ""
    t.integer "approved_user_id", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_id"
    t.text "description"
    t.integer "history_type", default: 0
    t.serial "id", null: false
    t.integer "points", default: 0
    t.integer "status", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.integer "updated_by_id"
    t.string "updated_by_resource"
    t.integer "valid_points", default: 0
  end

  create_table "marketing_edm_campaigns", id: false, force: :cascade do |t|
    t.text "body_html"
    t.datetime "created_at", precision: nil, null: false
    t.string "handle", limit: 255, default: ""
    t.serial "id", null: false
    t.boolean "is_sync_on_web", default: false
    t.boolean "is_sync_to_ios_today", default: true
    t.integer "latest_updated_user_id", default: 0
    t.string "name", default: ""
    t.integer "page_id"
    t.datetime "scheduled_date", precision: nil
    t.string "teaser_line", default: "| For 12 Hours Only! Save Up To $350! | #livebetter | Apartment Furniture  Décor"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "utm_campaign", default: "campaign"
    t.string "utm_content", default: "nldate"
    t.text "web_body_html"
  end

  create_table "marketing_edm_snippet_products", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "edm_snippet_id"
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "position", default: 0
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_edm_snippet_reviews", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "edm_snippet_id"
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.string "name", default: ""
    t.integer "position", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
    t.string "writeup", default: ""
  end

  create_table "marketing_edm_snippet_spacers", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "edm_snippet_id"
    t.integer "height", default: 10
    t.serial "id", null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_edm_snippet_taxons", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "edm_snippet_id"
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "position", default: 0
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_edm_snippets", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "edm_campaign_id", default: 0
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "position", default: 0
    t.integer "snippet_type", default: 0
    t.string "text", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
  end

  create_table "marketing_feed_taxonomy_matches", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "facebook_taxonomy_id", default: 0
    t.string "feed_taxonomy", default: ""
    t.integer "google_taxonomy_id", default: 0
    t.bigserial "id", null: false
    t.boolean "in_use", default: true
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_page_snippet_products", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "page_snippet_id"
    t.integer "position", default: 0
    t.integer "product_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_page_snippet_taxons", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.integer "page_snippet_id"
    t.integer "position", default: 0
    t.integer "taxon_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "marketing_page_snippets", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "image_url", default: ""
    t.string "mobile_image_url", default: ""
    t.integer "num_col_collection"
    t.integer "page_id", default: 0
    t.integer "position", default: 0
    t.integer "snippet_type", default: 0
    t.string "text", default: ""
    t.datetime "updated_at", precision: nil, null: false
    t.string "url", default: ""
  end

  create_table "marketing_platform_taxonomies", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.bigserial "id", null: false
    t.string "label", default: ""
    t.integer "platform_type", default: 0
    t.integer "taxonomy_id", default: 0
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "media_attachments", id: false, force: :cascade do |t|
    t.string "aspect_ratio"
    t.string "asset_id"
    t.datetime "created_at", precision: nil, null: false
    t.string "custom_url"
    t.float "duration"
    t.bigserial "id", null: false
    t.integer "max_height"
    t.integer "max_width"
    t.string "media_id"
    t.integer "media_type"
    t.string "playback_id"
    t.string "status"
    t.string "thumbnail_image"
    t.datetime "updated_at", precision: nil, null: false
    t.string "upload_id"
    t.string "video_url"
  end

  create_table "media_attachments_resources", id: false, force: :cascade do |t|
    t.bigint "attachable_id"
    t.string "attachable_type"
    t.bigserial "id", null: false
    t.bigint "media_attachment_id", null: false
  end

  create_table "media_image_attachments", id: false, force: :cascade do |t|
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "deleted_at", precision: nil
    t.string "file_name"
    t.integer "file_size"
    t.string "file_type"
    t.bigserial "id", null: false
    t.integer "image_type"
    t.string "key"
    t.string "src"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "month_multipliers", id: false, force: :cascade do |t|
    t.decimal "apr", default: "1.0"
    t.decimal "aug", default: "1.0"
    t.datetime "created_at", precision: nil, null: false
    t.decimal "dec", default: "1.0"
    t.decimal "feb", default: "1.0"
    t.serial "id", null: false
    t.decimal "jan", default: "1.0"
    t.decimal "jul", default: "1.0"
    t.decimal "jun", default: "1.0"
    t.decimal "mar", default: "1.0"
    t.decimal "may", default: "1.0"
    t.decimal "nov", default: "1.0"
    t.decimal "oct", default: "1.0"
    t.string "product_type"
    t.decimal "sep", default: "1.0"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "monthly_statitics", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "live_skus"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "online_return_forms", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "email", default: ""
    t.serial "id", null: false
    t.json "items", default: {}
    t.string "name", default: ""
    t.text "note", default: ""
    t.integer "order_number"
    t.json "preferred_options", default: {}
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_abandoned_order_line_items", id: false, force: :cascade do |t|
    t.integer "abandoned_order_id"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.decimal "price"
    t.integer "product_variant_id"
    t.integer "quantity"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_abandoned_orders", id: false, force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "billing_address_id"
    t.string "cart_session_id"
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", precision: nil
    t.integer "customer_id"
    t.integer "device_type"
    t.string "discount_code", default: ""
    t.string "email", default: ""
    t.integer "email_status", default: 0
    t.string "first_name", default: ""
    t.serial "id", null: false
    t.datetime "last_accessed_at", precision: nil
    t.string "last_name", default: ""
    t.datetime "last_updated_at", precision: nil
    t.string "phone", default: ""
    t.integer "recovery_status", default: 0
    t.string "session_id"
    t.integer "shipping_address_id"
    t.decimal "subtotal_price"
    t.decimal "total_discount"
    t.decimal "total_price"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_available_slots", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "day_of_week"
    t.integer "delivery_duration_in_minutes", default: 0
    t.serial "id", null: false
    t.integer "shipper_id", default: 2
    t.integer "time_slot_id"
    t.datetime "updated_at", precision: nil, null: false
    t.string "zone", default: ""
  end

  create_table "ops_base_units", id: false, force: :cascade do |t|
    t.integer "consigned_purchase_line_item_id"
    t.decimal "cost_price", default: "0.0"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "defected_at", precision: nil
    t.datetime "deleted_at", precision: nil
    t.serial "id", null: false
    t.datetime "intake_at", precision: nil
    t.decimal "invoice_price", default: "0.0"
    t.boolean "is_manually_reassign", default: false
    t.integer "order_line_item_id"
    t.integer "product_variant_id", null: false
    t.integer "purchase_line_item_id"
    t.decimal "selling_price", default: "0.0"
    t.integer "status", null: false
    t.integer "unit_number", null: false
    t.integer "unit_type", default: 0
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.integer "warehouse_id"
    t.integer "warehouse_location_id"
  end

  create_table "ops_block_out_slots", id: false, force: :cascade do |t|
    t.integer "block_in_minutes"
    t.date "block_out_date"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "shipper_id", default: 2, null: false
    t.integer "time_slot_id"
    t.datetime "updated_at", precision: nil, null: false
    t.string "zone", default: ""
  end

  create_table "ops_courier_delivery_timeslots", id: false, force: :cascade do |t|
    t.integer "courier_id"
    t.datetime "created_at", precision: nil, null: false
    t.integer "delivery_slot_id"
    t.integer "delivery_slot_type"
    t.integer "drop_off"
    t.serial "id", null: false
    t.integer "pick_up"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_couriers", id: false, force: :cascade do |t|
    t.text "address"
    t.string "contact_number"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_cust_country_settings", id: false, force: :cascade do |t|
    t.string "country_code", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "currency_code", default: "USD"
    t.float "deposit"
    t.float "deposit_threshold"
    t.serial "id", null: false
    t.integer "order_minimum_group_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_cust_order_minimum_groups", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "currency_code"
    t.integer "customers_count", default: 0
    t.serial "id", null: false
    t.integer "max_value"
    t.integer "min_value"
    t.integer "minimum_type"
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "value"
  end

  create_table "ops_defective_items", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "order_line_item_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_delivery_duration_references", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "product_type"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "value_in_minutes"
  end

  create_table "ops_delivery_method_options", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "delivery_method_type"
    t.boolean "enable"
    t.serial "id", null: false
    t.string "name", default: ""
    t.integer "shipper_id", default: 2, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_delivery_slots", id: false, force: :cascade do |t|
    t.string "accent", default: "#00bdb3"
    t.datetime "created_at", precision: nil, null: false
    t.integer "delivery_slot_type"
    t.integer "from_seconds_in_a_day"
    t.serial "id", null: false
    t.integer "to_seconds_in_a_day"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_drivers", id: false, force: :cascade do |t|
    t.text "cc_emails", default: "", null: false
    t.string "colour", default: ""
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.string "mobile", limit: 255, default: ""
    t.string "name", limit: 255, default: ""
    t.integer "position"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_inspection_images", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "inspection_id"
    t.string "src"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_inspection_verification_images", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "inspection_id"
    t.string "src"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_inspections", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.integer "defect_reason"
    t.integer "driver_decision", default: 0
    t.integer "failed_reason"
    t.serial "id", null: false
    t.integer "linked_as_is_product_id"
    t.string "notes"
    t.integer "order_line_item_id"
    t.integer "position"
    t.integer "reschedule_reason"
    t.integer "rescue_line_item_id"
    t.datetime "return_to_warehouse_at", precision: nil
    t.integer "return_warehouse_id"
    t.integer "status"
    t.datetime "updated_at", precision: nil
    t.integer "verify_action", default: 0
    t.string "verify_notes"
    t.integer "verify_status", default: 0
  end

  create_table "ops_inventories", id: false, force: :cascade do |t|
    t.integer "consigned", default: 0
    t.integer "consigned_used", default: 0
    t.datetime "created_at", precision: nil
    t.integer "distribution_stock", default: 0
    t.integer "ds_outstanding", default: 0
    t.integer "ds_return", default: 0
    t.serial "id", null: false
    t.integer "justified_ordered", default: 0
    t.integer "justified_spare", default: 0
    t.integer "loading_capacity", default: 0
    t.integer "outstanding", default: 0
    t.integer "product_variant_id"
    t.float "sell_through"
    t.integer "stock", default: 0
    t.integer "storage_stock", default: 0
    t.datetime "updated_at", precision: nil
    t.boolean "visible"
  end

  create_table "ops_inventory_changes", id: false, force: :cascade do |t|
    t.text "action"
    t.integer "consigned", default: 0
    t.integer "consigned_used", default: 0
    t.datetime "created_at", precision: nil
    t.integer "ds_outstanding", default: 0
    t.integer "ds_return", default: 0
    t.integer "fulfilled_order_line_item_id"
    t.serial "id", null: false
    t.integer "inventory_id"
    t.integer "inventory_transaction_id"
    t.integer "ordered", default: 0
    t.integer "outstanding", default: 0
    t.integer "source_type", default: 0
    t.integer "spare", default: 0
    t.integer "stock", default: 0
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_inventory_histories", id: false, force: :cascade do |t|
    t.text "action"
    t.integer "consign_spare"
    t.integer "consigned", default: 0
    t.integer "consigned_used", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.integer "customer_orders"
    t.integer "customer_orders_in_warehouse"
    t.integer "from_inventory_change_id"
    t.serial "id", null: false
    t.integer "inventory_id"
    t.integer "inventory_transaction_id"
    t.integer "order_line_item_id"
    t.integer "ordered", default: 0
    t.integer "source_type", default: 0
    t.integer "spare", default: 0
    t.integer "stock", default: 0
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_inventory_movements", id: false, force: :cascade do |t|
    t.integer "cancelled_quantity"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "intake_quantity"
    t.integer "inventory_id"
    t.integer "manual_add_quantity"
    t.integer "manual_remove_quantity"
    t.integer "orders"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_inventory_transactions", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.text "description"
    t.serial "id", null: false
    t.integer "source_event"
    t.integer "source_id"
    t.string "source_type", limit: 255
    t.datetime "updated_at", precision: nil
    t.integer "warehouse_id"
  end

  create_table "ops_inventory_versions", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "event", null: false
    t.serial "id", null: false
    t.integer "item_id", null: false
    t.string "item_type", null: false
    t.text "object"
    t.text "object_changes", default: ""
    t.string "source_type"
    t.string "whodunnit"
  end

  create_table "ops_late_order_line_items", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.integer "cs_agent_id"
    t.integer "final_action", default: 0
    t.serial "id", null: false
    t.integer "order_line_item_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_late_orders", id: false, force: :cascade do |t|
    t.text "buyer_comment", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.integer "cs_action", default: 0
    t.text "cs_comment", default: ""
    t.date "follow_up_date"
    t.serial "id", null: false
    t.string "internal_remarks", default: ""
    t.integer "order_id"
    t.date "revised_eta"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_mes_first_print_jobs", id: false, force: :cascade do |t|
    t.date "action_trigger_date"
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.integer "status", default: 0
    t.date "to_capturing_date"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id", default: 0
  end

  create_table "ops_order_comments", id: false, force: :cascade do |t|
    t.text "content", default: ""
    t.datetime "created_at", precision: nil
    t.integer "customer_id"
    t.serial "id", null: false
    t.integer "order_id"
    t.string "title", default: ""
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_order_containers", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.serial "id", null: false
    t.string "name"
    t.integer "order_id"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ops_order_line_items", id: false, force: :cascade do |t|
    t.boolean "assembly_inclusive", default: false
    t.string "blank", limit: 50
    t.integer "cancel_quantity", default: 0
    t.datetime "created_at", precision: nil
    t.integer "cs_inspection_note"
    t.datetime "deadline", precision: nil
    t.integer "defect_originator"
    t.integer "defect_reporter"
    t.integer "defect_type"
    t.datetime "defective_item_created_at", precision: nil
    t.string "defective_item_note"
    t.string "defective_item_status"
    t.date "delivery_date"
    t.integer "delivery_time_from_seconds"
    t.integer "delivery_time_to_seconds"
    t.boolean "excluded_review", default: false
    t.boolean "for_rescue", default: false
    t.integer "from_consign_spare", default: 0
    t.integer "from_consigned", default: 0
    t.integer "from_spare", default: 0
    t.integer "from_stock", default: 0
    t.datetime "fulfilled_at", precision: nil
    t.serial "id", null: false
    t.integer "inspection_check_status", default: 0
    t.datetime "intaked_at", precision: nil
    t.integer "line_item_type", default: 0
    t.datetime "loaded_at", precision: nil
    t.integer "lost_quantity", default: 0
    t.boolean "need_qc", default: false
    t.integer "num_arrived", default: 0
    t.integer "num_delivered_dropship", default: 0
    t.integer "num_dropship", default: 0
    t.integer "num_ordered", default: 0
    t.integer "num_retrieve", default: 0
    t.integer "order_container_id"
    t.integer "order_id"
    t.datetime "packing_at", precision: nil
    t.boolean "packing_delivered", default: false
    t.decimal "post_discount_price", default: "0.0"
    t.decimal "price"
    t.integer "processing_status"
    t.integer "product_variant_id"
    t.integer "purchase_line_item_id"
    t.integer "quantity"
    t.datetime "ready_to_ship_at", precision: nil
    t.boolean "received_defective_notification", default: false
    t.boolean "received_late_order_notification", default: false
    t.integer "redeem_points", default: 0
    t.string "remarks"
    t.string "shipping_mark_notes"
    t.string "shipping_mark_product_name"
    t.string "shipping_mark_sku"
    t.float "unit_cbm", default: 0.0
    t.datetime "updated_at", precision: nil
    t.text "variant_full_name"
  end

  create_table "ops_order_old_statuses", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "deadline", precision: nil
    t.serial "id", null: false
    t.integer "order_id"
    t.boolean "sent_thank_you_email", default: false
    t.integer "state_0"
    t.integer "state_1"
    t.integer "state_2"
    t.integer "state_3"
    t.integer "state_4"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_order_receipts", id: false, force: :cascade do |t|
    t.float "applied_pricing_tier_value"
    t.datetime "created_at", precision: nil
    t.decimal "credits", default: "0.0"
    t.float "credits_earned", default: 0.0
    t.string "customer_currency"
    t.float "deposit_amount", default: 0.0
    t.float "deposit_percent", default: 0.0
    t.string "discount_code", limit: 255
    t.float "exchange_rate"
    t.decimal "gst_cost"
    t.boolean "gst_included", default: false
    t.serial "id", null: false
    t.integer "order_id"
    t.decimal "shipping_fee"
    t.string "store_currency"
    t.decimal "subtotal_price"
    t.decimal "total_code_discount", default: "0.0"
    t.decimal "total_discount"
    t.decimal "total_price"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_order_refund_transactions", id: false, force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "order_id"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_order_statuses", id: false, force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.serial "id", null: false
    t.integer "order_id"
    t.integer "state"
    t.datetime "updated_at", precision: nil
  end

  create_table "ops_order_transactions", id: false, force: :cascade do |t|
    t.decimal "amount", default: "0.0"
    t.string "charge", limit: 255, default: ""
    t.datetime "created_at", precision: nil
    t.decimal "credits", default: "0.0"
    t.string "currency", limit: 255, default: ""
    t.string "device_id", limit: 255, default: ""
    t.string "error_code", limit: 255, default: ""
    t.integer "gateway"
    t.string "gateway_refund_id", limit: 255
    t.serial "id", null: false
    t.integer "kind"
    t.json "metadata", default: {}
    t.integer "order_id"
    t.integer "parent_id"
    t.json "payment_details", default: {}
    t.json "receipt", default: {}
    t.integer "refund_id"
    t.string "source_name", limit: 255, default: ""
    t.integer "status"
    t.datetime "updated_at", precision: nil
    t.integer "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "inventory_count"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.bigint "product_id", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_subscribers_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "subscribers", "products"
end
