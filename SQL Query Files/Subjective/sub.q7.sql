use chinook;

WITH CustomerMetrics AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.country,
        MIN(i.invoice_date) AS first_purchase_date,
        MAX(i.invoice_date) AS last_purchase_date,
        DATEDIFF(MAX(i.invoice_date), MIN(i.invoice_date)) + 1 AS tenure_days,
        COUNT(i.invoice_id) AS purchase_frequency,
        SUM(i.total) AS total_spent,
        ROUND(SUM(i.total) / COUNT(i.invoice_id), 2) AS avg_order_value,
        DATEDIFF(CURRENT_DATE, MAX(i.invoice_date)) AS days_since_last_purchase
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.country
)
SELECT
    customer_id,
    customer_name,
    country,
    tenure_days,
    purchase_frequency,
    total_spent,
    avg_order_value,
    days_since_last_purchase,
    CASE 
        WHEN days_since_last_purchase > 180 THEN 'Churned'
        WHEN days_since_last_purchase > 30 THEN 'At-Risk'
        ELSE 'Active'
    END AS customer_status,          
ROUND((total_spent / tenure_days) * 365, 2) AS estimated_clv_1year,
    ROUND(total_spent / tenure_days, 2) AS revenue_per_day     
FROM CustomerMetrics
ORDER BY days_since_last_purchase DESC; 
