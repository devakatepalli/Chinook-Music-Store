use chinook;

-- Purchasing Behavior by Region
SELECT billing_country as Region,
       COUNT(DISTINCT customer_id) AS num_customers,
       SUM(total) AS revenue,
       AVG(total) AS avg_order_value,
       COUNT(invoice_id) / COUNT(DISTINCT customer_id) AS avg_frequency
FROM invoice
GROUP BY billing_country
ORDER BY revenue DESC; 

    
-- Churn Rate by Region

WITH last_purchase AS (
    SELECT
        customer_id,
        billing_country AS region,
        MAX(invoice_date) AS last_order_date
    FROM invoice
    GROUP BY customer_id, billing_country
),
churned_customers AS (
    SELECT 
        region,
        COUNT(customer_id) AS churned_count  
    FROM last_purchase
    WHERE last_order_date < DATE_SUB('2020-12-30', INTERVAL 6 MONTH)
    GROUP BY region
)
SELECT 
    l.region, 
    COUNT(DISTINCT l.customer_id) AS total_customers,  
    COALESCE((SELECT churned_count FROM churned_customers c WHERE c.region = l.region),0) AS churned_customers,
    ROUND((COALESCE((SELECT churned_count FROM churned_customers c WHERE c.region = l.region),0)/COUNT(DISTINCT l.customer_id))*100,2) AS churn_rate
FROM last_purchase l
GROUP BY l.region
ORDER BY churned_customers DESC;
