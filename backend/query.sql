-- name: GetTotalSalesOverTime :many
SELECT 
  strftime('%Y-%m', order_purchase_timestamp) AS month, 
  SUM(oi.price) AS total_sales
FROM 
  orders o
JOIN 
  order_items oi ON o.order_id = oi.order_id
GROUP BY 
  month
ORDER BY 
  month;


-- name: GetSalesByCategory :many
SELECT 
  pcn.product_category_name_english, 
  SUM(oi.price) AS total_sales
FROM 
  order_items oi
JOIN 
  products p ON oi.product_id = p.product_id
JOIN 
  product_category_name_translation pcn ON p.product_category_name = pcn.product_category_name
GROUP BY 
  pcn.product_category_name_english
ORDER BY 
  total_sales DESC;


-- name: GetCustomerDistributionByState :many
SELECT 
  customer_state, 
  COUNT(*) AS customer_count
FROM 
  customers
GROUP BY 
  customer_state;


-- name: GetTopSellersBySales :many
SELECT 
  s.seller_id, 
  SUM(oi.price) AS total_sales
FROM 
  order_items oi
JOIN 
  sellers s ON oi.seller_id = s.seller_id
GROUP BY 
  s.seller_id
ORDER BY 
  total_sales DESC
LIMIT 10;


-- name: GetReviewScoreDistribution :many
SELECT 
  review_score, 
  COUNT(*) AS review_count
FROM 
  order_reviews
GROUP BY 
  review_score
ORDER BY 
  review_score;


-- name: GetAverageReviewScoreOverTime :many
SELECT 
  strftime('%Y-%m', review_creation_date) AS month, 
  AVG(review_score) AS average_review_score
FROM 
  order_reviews
GROUP BY 
  month
ORDER BY 
  month;


-- name: GetPaymentMethodsDistribution :many
SELECT 
  payment_type, 
  COUNT(*) AS payment_count
FROM 
  order_payments
GROUP BY 
  payment_type
ORDER BY 
  payment_count DESC;


-- name: GetInstallmentsUsage :many
SELECT 
  payment_installments, 
  COUNT(*) AS installment_count
FROM 
  order_payments
GROUP BY 
  payment_installments
ORDER BY 
  payment_installments;