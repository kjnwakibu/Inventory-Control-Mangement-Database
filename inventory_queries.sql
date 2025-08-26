-- View all products
SELECT * FROM products;

-- Add a new product to the tables
INSERT INTO products (name, price, category)
VALUES
("product name", 10.99 , "tech");

INSERT INTO inventory_info (product_name, in_stock, last_date)
VALUES
("product name", 10, CURRENT_DATE);

-- Delete a product from the products able
DELETE FROM products WHERE name = "product name";

-- Process a transaction of a specific product
UPDATE inventory_info
SET in_stock = in_stock - 1
WHERE product_id = 2;

-- View stock levels for all products
SELECT product_id, product_name, in_stock  FROM inventory_info;

-- View products with low stock levels
SELECT product_id, product_name, in_stock FROM inventory_info
WHERE in_stock <= 1;

-- View transactions starting from the newest date to earliest date
SELECT * FROM transactions
JOIN inventory_info ON transactions.product_id = inventory_info.product_id
ORDER BY transactions.date DESC;

-- View products with the category "outdoors"
SELECT * FROM products
WHERE category = "outdoors";

-- View the transaction history of a specific category
SELECT * FROM transactions
WHERE product_id = 33;

-- View the transactions that happened on a specific date
SELECT * FROM TRANSACTIONS
WHERE date = '2025-08-30';

-- View products that haven't been sold yet
SELECT * from inventory_info i
LEFT JOIN transactions t ON t.product_id = i.product_id
WHERE t.date IS NULL;

-- Update the inventory stock level of a product
UPDATE inventory
SET in_stock = in_stock + 10
WHERE product_id = 1;

-- View the amount of transactions of a specific month
SELECT *  FROM transactions t
JOIN inventory_info i ON i.product_id = t.product_id
WHERE MONTH(t.date) = MONTH('2005-05-07')
ORDER BY quantity DESC;

-- View the amount of revenue for a specific month
SELECT SUM(t.quantity * p.price) AS total_revenue
FROM transactions t
JOIN products p ON t.product_id = p.product_id
WHERE MONTH(t.date) = MONTH('2025-05-01');

-- View which category has the most of the transactions for a specific month
SELECT p.category, SUM(t.quantity) AS total_sold
FROM Transactions t
JOIN Products p ON t.product_id = p.product_id
AND MONTH(t.date) = MONTH('2005-05-01')
GROUP BY p.category
ORDER BY total_sold DESC
LIMIT 1;

-- View which kind of weather has the most transactions for a specific month
SELECT t.weather, SUM(t.quantity) AS total_sold
FROM Transactions t
GROUP BY t.weather
ORDER BY total_sold DESC;

-- View the amount of sales for clearance and non-clearance products for a specific month
SELECT i.clearance, SUM(t.quantity) AS total_sold
FROM Transactions t
JOIN inventory_info i ON t.product_id = i.product_id
AND MONTH(t.date) = MONTH('2005-05-01')
GROUP BY i.clearance
ORDER BY total_sold DESC