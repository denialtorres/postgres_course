-- exercise one

SELECT paid, COUNT(*)
FROM orders
GROUP BY paid;


-- exercise two
SELECT first_name, last_name, paid
FROM orders
JOIN users ON users.id = orders.user_id;
