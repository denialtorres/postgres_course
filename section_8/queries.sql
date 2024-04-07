-- normal
(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION
(
  SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);

-- without removing the duplicates

(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
UNION ALL
(
  SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);

-- INTERSEC shows only the row common in two queries 

(
  SELECT *
  FROM products
  ORDER BY price DESC
  LIMIT 4
)
INTERSECT
(
  SELECT *
  FROM products
  ORDER BY price/weight DESC
  LIMIT 4
);
