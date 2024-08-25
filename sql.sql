CREATE TABLE SUPPLIER_MASTER (
	supplier_id SMALLSERIAL PRIMARY KEY,
	supplier_name VARCHAR(50) NOT NULL,
	supplier_city VARCHAR(50) NOT NULL
);

CREATE TABLE product_category_master (
	category_id SMALLSERIAL PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL
);

CREATE TABLE stationary (
	stationary_id SMALLSERIAL PRIMARY KEY,
	category_id INT NOT NULL,
	stationary_type VARCHAR(50) UNIQUE NOT NULL,
	CONSTRAINT "fk_category_id" FOREIGN KEY ("category_id") REFERENCES product_category_master("category_id")  
);

CREATE TABLE stationary_notebook (
	notebook_id SMALLSERIAL PRIMARY KEY,
	stationary_id INT NOT NULL,
	brand VARCHAR(50) NOT NULL,
	number_of_pages INT NOT NULL,
	minimum_quantity INT NOT NULL,
	CONSTRAINT "fk_stationary_id" FOREIGN KEY ("stationary_id") REFERENCES stationary("stationary_id")
);

CREATE TABLE stationary_pencil (
	pencil_id SMALLSERIAL PRIMARY KEY,
	stationary_id INT,
	brand VARCHAR(50) NOT NULL,
	grade VARCHAR(10) NOT NULL,
	minimum_quantity INT NOT NULL,
	CONSTRAINT  "fk_stationary_id" FOREIGN KEY ("stationary_id") REFERENCES stationary("stationary_id")
);

CREATE TABLE notebook_transaction (
	transaction_id SMALLSERIAL PRIMARY KEY,
	notebook_id INT NOT NULL,
	transaction_type VARCHAR(1), -- O - Order, S - Sale
	ordered_quantity INT,
	ordered_price NUMERIC,
	sold_quantity INT,
	sold_price NUMERIC,
	total_amount NUMERIC,
	transaction_datetime TIMESTAMP,
	supplier_id INT,
	CONSTRAINT "fk_notebook_id" FOREIGN KEY ("notebook_id") REFERENCES stationary_notebook("notebook_id"),
	CONSTRAINT "fk_supplier_id" FOREIGN KEY ("supplier_id") REFERENCES supplier_master("supplier_id")
);

CREATE TABLE pencil_transaction (
	transaction_id SMALLSERIAL PRIMARY KEY,
	pencil_id INT NOT NULL,
	transaction_type VARCHAR(1), -- O - Order, S - Sale
	ordered_quantity INT,
	ordered_price NUMERIC,
	sold_quantity INT,
	sold_price NUMERIC,
	total_amount NUMERIC,
	transaction_datetime TIMESTAMP,
	supplier_id INT,
	CONSTRAINT "fk_pencil_id" FOREIGN KEY ("pencil_id") REFERENCES stationary_pencil("pencil_id"),
	CONSTRAINT "fk_supplier_id" FOREIGN KEY ("supplier_id") REFERENCES supplier_master("supplier_id")
);

