

CREATE TABLE products (
 	id INT,
    name VARCHAR(50),
	price DOUBLE(5, 0),
    category VARCHAR(50)
);

CREATE TABLE inventory_info (
	in_stock INT,
    last_date DATE
);

CREATE TABLE transactions (
	trans_id INT,
    type VARCHAR(4),
    date DATE,
    total_price DOUBLE(5, 0),
    quantity INT
)

