use chinook;

WITH cte AS (
    SELECT 
        i.customer_id, 
        MAX(invoice_date) AS last_purchase_date, 
        MIN(invoice_date) AS first_purchase_date,
        SUM(total) AS total_spent, 
        SUM(quantity) AS items_bought, 
        COUNT(i.customer_id) AS frequency,
        ABS(TIMESTAMPDIFF(DAY, MAX(invoice_date), MIN(invoice_date))) AS customer_since_days
    FROM invoice i
    LEFT JOIN invoice_line il ON il.invoice_id = i.invoice_id
    LEFT JOIN customer c ON c.customer_id = i.customer_id
    GROUP BY i.customer_id
),
long_short_term AS (
    SELECT 
        total_spent, 
        items_bought, 
        frequency,
        CASE
            WHEN customer_since_days > (SELECT AVG(customer_since_days) AS average_days FROM cte) 
            THEN 'Long Term' 
            ELSE 'Short Term' 
        END AS term
    FROM cte
)
SELECT 
    term, 
    AVG(total_spent) AS average_spending, 
    AVG(items_bought) AS average_basket_size, 
    COUNT(frequency) AS number_of_customers 
FROM long_short_term 
GROUP BY term;
