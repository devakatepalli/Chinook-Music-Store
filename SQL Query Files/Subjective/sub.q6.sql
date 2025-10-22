use chinook;

-- Query for High-Risk Customer Segments

WITH customer_summary AS (
    SELECT 
        c.customer_id,
        c.country,
        COUNT(i.invoice_id) AS total_orders,
        SUM(il.unit_price * il.quantity) AS total_spent,
        MAX(i.invoice_date) AS last_purchase_date,
        DATEDIFF(CURRENT_DATE, MAX(i.invoice_date)) AS days_since_last_purchase
    FROM customer c
    LEFT JOIN invoice i ON c.customer_id = i.customer_id
    LEFT JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY c.customer_id, c.country
),
customer_risk AS (
    SELECT 
        customer_id,
        country,
        total_orders,
        total_spent,
        last_purchase_date,
        days_since_last_purchase,
        CASE
            WHEN days_since_last_purchase > 180 THEN 'High Risk'
            WHEN days_since_last_purchase BETWEEN 90 AND 180 THEN 'Medium Risk'
            ELSE 'Low Risk'
        END AS churn_risk,
        CASE
            WHEN total_spent < 100 THEN 'Low Value'
            WHEN total_spent BETWEEN 100 AND 500 THEN 'Medium Value'
            ELSE 'High Value'
        END AS value_segment
    FROM customer_summary
)
SELECT *
FROM customer_risk
ORDER BY churn_risk DESC, total_spent ASC;
