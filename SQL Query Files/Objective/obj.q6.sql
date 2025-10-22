use chinook;

WITH RankedTracks AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        t.name AS track_name,
        SUM(il.quantity) AS total_quantity_sold,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY SUM(il.quantity) DESC) AS rank_num
    FROM
        customer AS c
    JOIN
        invoice AS i ON c.customer_id = i.customer_id
    JOIN
        invoice_line AS il ON i.invoice_id = il.invoice_id
    JOIN
        track AS t ON il.track_id = t.track_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        t.name
)
SELECT
    customer_id,
    first_name,
    last_name,
    track_name,
    total_quantity_sold
FROM
    RankedTracks
WHERE
    rank_num = 1
ORDER BY
    customer_id;