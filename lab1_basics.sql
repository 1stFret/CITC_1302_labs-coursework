-- Query 1: Four columns from products table
SELECT product_code, product_name, list_price, discount_percent 
FROM products
ORDER BY list_price DESC;

-- Query 2: One column from customers table
SELECT last_name || ', ' || first_name AS full_name 
FROM customers
WHERE last_name >= 'M'
ORDER BY last_name;

-- Query 3: Three columns from products table
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- Query 4: Five columns from products table
SELECT product_name, list_price, discount_percent,
    (list_price * discount_percent / 100) AS discount_amount,
    (list_price - (list_price * discount_percent / 100)) AS discount_price
FROM products
ORDER BY discount_price DESC
FETCH FIRST 5 ROWS ONLY;


-- Query 5: Seven columns from order_items table
SELECT item_id, item_price, discount_amount, quantity,
    (item_price * quantity) AS price_total,
    (discount_amount * quantity) AS discount_total,
    ((item_price - discount_amount) * quantity) AS item_total
FROM order_items
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY item_total DESC;

-- Query 6: Three columns from orders table
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;

-- Query 7: A row with SYSDATE function
SELECT SYSDATE AS today_unformatted, 
TO_CHAR(SYSDATE, 'MM-DD-YYYY') AS today_formatted
FROM DUAL;

-- Query 8: A SELECT statement creataing row with four columns
SELECT 100 AS price, 
    .07 AS tax_rate,
    (100 * .07) AS tax_amount,
    (100 + (100 * .07)) AS total
FROM DUAL;
