use chinook;

WITH last_purchase AS (
    SELECT 
        customer_id, 
        MAX(invoice_date) AS last_order_date
    FROM invoice
    GROUP BY customer_id
),
churned_customers AS (
    SELECT 
        COUNT(customer_id) AS churned_count
    FROM last_purchase
    WHERE last_order_date < DATE_SUB(( SELECT max(invoice_date) from invoice), INTERVAL 6 MONTH)
),
total_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS total_count FROM customer
)
SELECT 
    (c.churned_count / t.total_count) * 100 AS churn_rate
FROM churned_customers c, total_customers t;

