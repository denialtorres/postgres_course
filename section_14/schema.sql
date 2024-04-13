-- Create main table

CREATE TABLE products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  price INTEGER,
  weight INTEGER
);


-- Add one record to the products table
INSERT INTO products (name, department, price, weight)
VALUES
  ('Shirt', 'Clothes', 20, 1);
