use chinook;

WITH CustomerSummary AS (
    -- 1. Calculate Total Spent and Total Tracks Purchased for EACH CUSTOMER
    SELECT
        i.customer_id,
        SUM(i.total) AS total_spent,
        SUM(il.quantity) AS tracks_purchased
    FROM
        invoice AS i
    JOIN
        invoice_line AS il ON i.invoice_id = il.invoice_id
    GROUP BY
        i.customer_id
)
SELECT
    c.country,
    COUNT(c.customer_id) AS num_customers,
    -- Average total amount spent by customers from this country
    ROUND(AVG(cs.total_spent), 2) AS avg_spent_per_customer,
    -- Average number of tracks purchased by customers from this country
    ROUND(AVG(cs.tracks_purchased), 2) AS avg_tracks_per_customer
FROM
    customer AS c
JOIN
    CustomerSummary AS cs ON c.customer_id = cs.customer_id
GROUP BY
    c.country
ORDER BY
    num_customers DESC,
    avg_spent_per_customer DESC;