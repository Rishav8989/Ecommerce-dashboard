-- name: SearchCustomerByUniqueID :one
SELECT * FROM customers WHERE customer_unique_id = ?;

-- name: SearchSellerByID :one
SELECT * FROM sellers WHERE seller_id = ?;

-- name: SearchOrdersByCustomerID :many
SELECT * FROM orders WHERE customer_id = ?;

-- name: SearchOrderItemsByOrderID :many
SELECT * FROM order_items WHERE order_id = ?;

-- name: SearchProductByID :one
SELECT * FROM products WHERE product_id = ?;

-- name: SearchLeadsQualifiedByLandingPageID :many
SELECT * FROM leads_qualified WHERE landing_page_id = ?;

-- name: SearchLeadsClosedBySellerID :many
SELECT * FROM leads_closed WHERE seller_id = ?;
