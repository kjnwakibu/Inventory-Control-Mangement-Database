

CREATE TABLE products (
 	id INT,
    name VARCHAR(45),
	price DOUBLE(5, 0),
    category VARCHAR(50)
);

CREATE TABLE inventory_info (
	product_id INT,
    product_name VARCHAR(45),
	in_stock INT,
    last_date DATE,
    clearance VARCHAR(3)
);

CREATE TABLE transactions (
	product_id INT,
    type VARCHAR(4),
    date DATE,
    total_price DOUBLE(5, 0),
    quantity INT,
    weather VARCHAR(45)
)

