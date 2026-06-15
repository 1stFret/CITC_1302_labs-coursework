--Query 1: Insert row into categories table
INSERT INTO categories (category_id, category_name)
VALUES (5, 'Brass');

--Query 2:Modify row in category table
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = 5;

--Query 3: Delete row from category table
DELETE FROM categories
WHERE category_id = 5;

--Query 4: Add row to products table
INSERT INTO products (product_id, category_id, product_code, product_name,
    description, list_price, date_added)
    VALUES (11, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano',
    'Long description to come.', 799.99, SYSDATE);

--Query 5: Modify query 4 update
UPDATE products
SET discount_percent = 35
WHERE product_id = 11;

--Query 6: Delete keyboards category
DELETE products
WHERE category_id = 4;

DELETE categories
WHERE category_id = 4;

--Query 7: Insert row to customer table
INSERT INTO customers (customer_id, email_address, password, first_name, last_name)
VALUES (9, 'rick@raven.com', 'sesame', 'Rick', 'Raven');
 
--Query 8: Update customer table modification
UPDATE customers
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

--Query 9: Update customer table
UPDATE customers
SET password = 'reset';

--Query 10: Rollback statement
ROLLBACK;
