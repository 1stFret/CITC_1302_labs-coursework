-- Lab 3
-- Michael Rogers

-- Query 1 joins categories and products
SELECT category_name, product_name, list_price
FROM categories JOIN products
ON categories.category_id = products.category_id
ORDER BY category_name, product_name;


-- Query 2 joins customers table and address table
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers 
JOIN addresses
ON customers.customer_id = addresses.customer_id
WHERE customers.email_address = 'allan.sherwood@yahoo.com';


-- Query 3 joins customers table and address table
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers c 
JOIN addresses a
ON c.customer_id = a.customer_id
WHERE c.shipping_address_id = a.address_id;

-- Query 4 joins customers, orders, order_items, and products tables
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers c 
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON p.product_id = oi.product_id
ORDER BY last_name, order_date, product_name;

-- Query 5 returns product_name and list_price from products table
SELECT DISTINCT p1.product_name, p1.list_price
FROM products p1
JOIN products p2
    ON p1.product_id <> p2.product_id 
    AND p1.list_price = p2.list_price
ORDER BY p1.product_name;

-- Query 6 returns category_name and product_id
SELECT c.category_name, p.product_id
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

-- Query 7 use a UNION to return from orders table
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;

-- Query 8 returns count() and sum() from order table
SELECT COUNT(*) AS total_orders, SUM(tax_amount) AS total_tax
FROM orders;  

-- Query 9 category product counts and maximum list price
SELECT c.category_name, COUNT(p.product_id) AS product_count, MAX(p.list_price) AS max_price
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY product_count DESC;

-- Query 10 customer total order value and total discount amount
SELECT c.email_address, SUM(oi.item_price * oi.quantity) AS total_order_value, SUM(oi.discount_amount
* oi.quantity) AS total_discount_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY total_order_value DESC;
