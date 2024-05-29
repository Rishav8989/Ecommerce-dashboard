# E commerce Dashboard

### 1. Sales Analysis
- **Total Sales Over Time:** Line chart showing total sales amount (sum of `price` from `order_items`) over different time periods (days, months, etc.).
- **Sales by Category:** Bar chart or pie chart showing sales distribution across different product categories (using `product_category_name_english` from `product_category_name_translation`).

### 2. Customer Insights
- **Customer Distribution by State:** Choropleth map showing the number of customers in each state (from `customers` table).
- **Average Order Value by Customer:** Bar chart showing average order value per customer (from `orders` and `order_items`).

### 3. Seller Insights
- **Seller Distribution by State:** Choropleth map showing the number of sellers in each state (from `sellers` table).
- **Top Sellers by Sales:** Bar chart showing top sellers based on total sales amount (sum of `price` from `order_items`).

### 4. Product Analysis
- **Top Selling Products:** Bar chart showing products with the highest sales (sum of `price` from `order_items`).
- **Product Category Popularity:** Bar chart showing the number of products sold in each category (using `product_category_name_english`).

### 5. Order and Delivery Insights
- **Order Status Distribution:** Pie chart showing the distribution of order statuses (from `orders` table).
- **Delivery Performance:** Line chart showing the average delivery time (difference between `order_delivered_customer_date` and `order_purchase_timestamp`) over time.

### 6. Payment Insights
- **Payment Methods Distribution:** Pie chart showing the distribution of different payment methods (from `order_payments`).
- **Installments Usage:** Bar chart showing the distribution of payment installments (from `order_payments`).

### 7. Review Analysis
- **Review Score Distribution:** Histogram showing the distribution of review scores (from `order_reviews`).
- **Average Review Score Over Time:** Line chart showing the average review score over different time periods.

### 8. Geolocation Insights
- **Geographical Distribution of Orders:** Heatmap showing the density of orders across different regions based on `geolocation_zip_code_prefix`.
- **Order Value by Location:** Choropleth map showing average order value by geolocation (combining `order_items` and `geolocation` tables).

### 9. Lead Insights (if relevant)
- **Lead Conversion Funnel:** Funnel chart showing the conversion rates from leads to qualified leads to closed leads.
- **Lead Source Analysis:** Pie chart showing the distribution of lead origins (from `leads_qualified`).
