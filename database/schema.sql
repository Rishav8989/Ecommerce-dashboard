CREATE TABLE IF NOT EXISTS product_category_name_translation (
  product_category_name TEXT,
  product_category_name_english TEXT
);

CREATE TABLE IF NOT EXISTS sellers (
  seller_id TEXT,
  seller_zip_code_prefix INTEGER,
  seller_city TEXT,
  seller_state TEXT
);

CREATE TABLE IF NOT EXISTS customers (
  customer_id TEXT,
  customer_unique_id TEXT,
  customer_zip_code_prefix INTEGER,
  customer_city TEXT,
  customer_state TEXT
);

CREATE TABLE IF NOT EXISTS geolocation (
  geolocation_zip_code_prefix INTEGER,
  geolocation_lat REAL,
  geolocation_lng REAL,
  geolocation_city TEXT,
  geolocation_state TEXT
);

CREATE TABLE IF NOT EXISTS order_items (
  order_id TEXT,
  order_item_id INTEGER,
  product_id TEXT,
  seller_id TEXT,
  shipping_limit_date TEXT,
  price REAL,
  freight_value REAL
);

CREATE TABLE IF NOT EXISTS order_payments (
  order_id TEXT,
  payment_sequential INTEGER,
  payment_type TEXT,
  payment_installments INTEGER,
  payment_value REAL
);

CREATE TABLE IF NOT EXISTS order_reviews (
  review_id TEXT,
  order_id TEXT,
  review_score INTEGER,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date TEXT,
  review_answer_timestamp TEXT
);

CREATE TABLE IF NOT EXISTS orders (
  order_id TEXT,
  customer_id TEXT,
  order_status TEXT,
  order_purchase_timestamp TEXT,
  order_approved_at TEXT,
  order_delivered_carrier_date TEXT,
  order_delivered_customer_date TEXT,
  order_estimated_delivery_date TEXT
);

CREATE TABLE IF NOT EXISTS products (
  product_id TEXT,
  product_category_name TEXT,
  product_name_length REAL,
  product_description_length REAL,
  product_photos_qty REAL,
  product_weight_g REAL,
  product_length_cm REAL,
  product_height_cm REAL,
  product_width_cm REAL
);

CREATE TABLE IF NOT EXISTS leads_qualified (
  mql_id TEXT,
  first_contact_date TEXT,
  landing_page_id TEXT,
  origin TEXT
);

CREATE TABLE IF NOT EXISTS leads_closed (
  mql_id TEXT,
  seller_id TEXT,
  sdr_id TEXT,
  sr_id TEXT,
  won_date TEXT,
  business_segment TEXT,
  lead_type TEXT,
  lead_behaviour_profile TEXT,
  has_company INTEGER,
  has_gtin INTEGER,
  average_stock TEXT,
  business_type TEXT,
  declared_product_catalog_size REAL,
  declared_monthly_revenue REAL
);
