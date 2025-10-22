use chinook;

WITH latest_purchase as
(
SELECT max(invoice_date) as latest_purchase
FROM invoice
),
customer_latest_order as 
(
SELECT customer_id, max(invoice_date) as customer_latest_purchase
FROM invoice 
GROUP BY customer_id
),
3_months_difference as 
(
SELECT DATE_SUB(latest_purchase, INTERVAL 3 MONTH) as last_three_months
FROM latest_purchase
)
SELECT c.customer_id, c.first_name, c.last_name, c.country
FROM customer c
JOIN customer_latest_order clo 
ON c.customer_id = clo.customer_id
CROSS JOIN 3_months_difference tmd
WHERE clo.customer_latest_purchase < tmd.last_three_months;