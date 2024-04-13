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

-- Addint a gotcha for null values
UPDATE products
SET price = 999
WHERE products.price IS NULL;

-- Adding new constraint for price column
ALTER TABLE products
ALTER COLUMN price
SET NOT NULL;


-- Set default values if not included
ALTER TABLE products
ALTER COLUMN price
SET DEFAULT 999;

-- Uniq constraint validation
ALTER TABLE products
ADD UNIQUE(name);

-- Remove contstraint
ALTER TABLE products
DROP CONSTRAINT products_name_key;

-- Multi column constraint
ALTER TABLE products
ADD UNIQUE (name, department);

--Adding Validation Check
ALTER TABLE products
ADD CHECK (price>0);

-- Create Orders table
-- CHECK more than one COLUMN
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  created_at TIMESTAMP NOT NULL,
  est_delivery TIMESTAMP NOT NULL,
  CHECK (created_at < est_delivery)
)
