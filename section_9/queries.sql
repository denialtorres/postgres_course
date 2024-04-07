-- subqueries inside a WHERE clause
SELECT
  id
FROM
  orders
WHERE
  product_id IN (
    SELECT
      id
    FROM
      products
    WHERE
      price / weight > 50
  );

-- show the name of all products with price greater
-- than the average product price

SELECT
  name
FROM
  products
WHERE
  price > (
    SELECT
      AVG(price)
    FROM
      products
  );

  -- Write a query that prints out the name
  -- and price of phones that have a price greater than the Samsung S5620 Monte.

SELECT
 name, price
FROM phones
WHERE price > (
	SELECT price
  FROM phones
  WHERE name = 'S5620 Monte'
);


-- Show the name of all products that are not in the same deparment
-- as products with a price less than 100

SELECT
  name, department
FROM
  products
WHERE
  department NOT IN (
    SELECT
      department
    FROM
      products
    WHERE
      price < 100
  );

  -- Show the name, deparment, and price
  -- of products that are more expensive than
  -- all products in the 'industrial' deparment

  SELECT name, department, price
  FROM products
  WHERE price > ALL (
    SELECT price
    FROM products
    WHERE department = 'Industrial'
  );

  -- Show the name of products that are more expensive
  -- than at least one product in the 'Industrial' department

  SELECT name, department, price
  FROM products
  WHERE price > ANY (
  	SELECT price
    FROM products
    WHERE department = 'Industrial'
  );


-- - Write a query that prints the name of all phones
-- - that have a price greater than all phones made by Samsung.
  SELECT name
  FROM phones
  WHERE price > ALL (
  	SELECT price FROM phones WHERE manufacturer = 'Samsung'
  );


-- Show the name, deparment and price
-- of the most expensive product in each deparment

SELECT name, department, price
FROM products AS p1
WHERE p1.price = (
	SELECT MAX(price)
	FROM products AS p2
  WHERE p2.department = p1.department
);


-- Without using a join or a group_by,
-- print the number for orders for each product

SELECT name, (
	SELECT COUNT(*)
	FROM orders AS o1
	WHERE o1.product_id = p1.id
)
FROM products AS p1;


-- Using only subqueries, print the max price, min price,
-- and average price of all phones.  Rename each column to max_price, min_price, avg_price

SELECT(
    SELECT
      MAX(price)
    FROM
      products
  ) AS max_price,
  (
    SELECT
      MIN(price)
    FROM
      products
  ) AS min_price,
  (
    SELECT
      AVG(price)
    FROM
      products
  ) AS avg_price;

-- Print each product and its price
-- Also print the description of the price
-- If price > 600 then 'high'
-- IF price < 300 then 'medium'
-- else print 'cheap'

SELECT
	name,
	price,
	CASE
		WHEN price > 600 THEN 'high'
		WHEN price > 300 THEN 'medium'
		ELSE 'cheap'
  END
FROM products;
