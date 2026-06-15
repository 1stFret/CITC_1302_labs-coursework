-- Query 1: Create customer_addresses view

CREATE OR REPLACE VIEW customer_addresses AS
    SELECT c.customer_id, c.email_address, c.last_name, c.first_name,
        a.bill_line1, a.bill_line2, a.bill_city, a.bill_state, a.bill_zip, 
        a.ship_line1, a.ship_line2, a.ship_city, a.ship_state, a.ship_zip
    FROM customers c
    JOIN addresses a ON c.customer_id = a.customer_id
    ORDER BY c.last_name, c.first_name;

-- Query 2: Returning columns from customer_addresses view

SELECT customer_id, last_name, first_name, bill_line1
FROM customer_addresses;

-- Query 3: Create order_item_products view

CREATE OR REPLACE VIEW order_item_products AS
    SELECT p.product_name, o.order_id, o.order_date, o.tax_amount, o.ship_date,
        oi.item_price, oi.discount_amount, (oi.item_price - oi.discount_amount) AS final_price,
        oi.quantity, (oi.item_price - oi.discount_amount) * oi.quantity AS item_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id;

-- Query 4: Create product_summary view

CREATE OR REPLACE VIEW product_summary AS
    SELECT product_name, COUNT(order_id) AS order_count, 
        SUM(item_total) AS order_total
    FROM order_item_products
    GROUP BY product_name;

-- Query 5: Queryproduct_summary view

SELECT *
FROM product_summary
ORDER BY order_total DESC
FETCH FIRST 5 ROWS ONLY;
