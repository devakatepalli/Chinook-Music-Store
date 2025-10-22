use chinook;

WITH CustomerRevenue AS (
    SELECT
        c.country,
        c.first_name,
        c.last_name,
        SUM(i.total) AS total_revenue,
        RANK() OVER (PARTITION BY c.country ORDER BY SUM(i.total) DESC) AS revenue_rank
    FROM
        customer AS c
    JOIN
        invoice AS i ON c.customer_id = i.customer_id
    GROUP BY
        c.country,
        c.first_name,
        c.last_name
)
SELECT
    country,
    first_name,
    last_name,
    total_revenue,
    revenue_rank
FROM
    CustomerRevenue
WHERE
    revenue_rank <= 5
ORDER BY
    country,
    revenue_rank;