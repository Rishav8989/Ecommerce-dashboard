-- name: CreateProduct :exec
INSERT INTO products (
    product_category_name, product_name_length,
    product_description_length, product_photos_qty, product_weight_g,
    product_length_cm, product_height_cm, product_width_cm
) VALUES (
    ?, ?, ?, ?, ?, ?, ?, ?
);

-- name: GetProduct :one
SELECT * FROM products WHERE product_id = ?;

-- name: ListProducts :many
SELECT * FROM products;

-- name: UpdateProduct :exec
UPDATE products SET
    product_category_name = ?, product_name_length = ?, product_description_length = ?,
    product_photos_qty = ?, product_weight_g = ?, product_length_cm = ?, product_height_cm = ?,
    product_width_cm = ?
WHERE product_id = ?;

-- name: DeleteProduct :exec
DELETE FROM products WHERE product_id = ?;
