CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_category_name VARCHAR(255) NOT NULL,
    product_name_length INT NOT NULL,
    product_description_length INT NOT NULL,
    product_photos_qty INT NOT NULL,
    product_weight_g INT NOT NULL,
    product_length_cm INT NOT NULL,
    product_height_cm INT NOT NULL,
    product_width_cm INT NOT NULL
);

CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(255) PRIMARY KEY,
    product_category_name_english VARCHAR(255) NOT NULL
);

CREATE TABLE order_payments (
    order_id INT NOT NULL,
    payment_sequential INT NOT NULL,
    payment_type VARCHAR(255) NOT NULL,
    payment_installments INT NOT NULL,
    payment_value DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_status VARCHAR(255) NOT NULL,
    order_purchase_timestamp TIMESTAMP NOT NULL,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_unique_id VARCHAR(255) NOT NULL,
    customer_zip_code_prefix INT NOT NULL,
    customer_city VARCHAR(255) NOT NULL,
    customer_state VARCHAR(255) NOT NULL
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    order_item_id INT NOT NULL,
    product_id INT NOT NULL,
    seller_id INT NOT NULL,
    shipping_limit_date TIMESTAMP NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    freight_value DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_zip_code_prefix INT NOT NULL,
    seller_city VARCHAR(255) NOT NULL,
    seller_state VARCHAR(255) NOT NULL
);

CREATE TABLE order_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    review_score INT NOT NULL,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP NOT NULL,
    review_answer_timestamp TIMESTAMP
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT NOT NULL,
    geolocation_lat DECIMAL(10, 8) NOT NULL,
    geolocation_lng DECIMAL(11, 8) NOT NULL,
    geolocation_city VARCHAR(255) NOT NULL,
    geolocation_state VARCHAR(255) NOT NULL,
    PRIMARY KEY (geolocation_zip_code_prefix)
);

CREATE TABLE leads_qualified (
    mql_id INT AUTO_INCREMENT PRIMARY KEY,
    first_contact_date TIMESTAMP NOT NULL,
    landing_page_id INT NOT NULL,
    origin VARCHAR(255) NOT NULL
);

CREATE TABLE leads_closed (
    mql_id INT NOT NULL,
    seller_id INT NOT NULL,
    sdr_id INT NOT NULL,
    sr_id INT NOT NULL,
    won_date TIMESTAMP NOT NULL,
    business_segment VARCHAR(255) NOT NULL,
    lead_type VARCHAR(255) NOT NULL,
    lead_behaviour_profile VARCHAR(255) NOT NULL,
    has_company BOOLEAN NOT NULL,
    has_gtin BOOLEAN NOT NULL,
    average_stock INT NOT NULL,
    business_type VARCHAR(255) NOT NULL,
    declared_product_catalog_size INT NOT NULL,
    declared_monthly_revenue DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (mql_id, seller_id)
);
