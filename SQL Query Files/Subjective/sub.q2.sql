use chinook;

SELECT
    i.billing_country,
    g.name AS genre_name,
    SUM(il.quantity * il.unit_price) AS total_sales
FROM
    invoice_line AS il
JOIN
    track AS t ON il.track_id = t.track_id
JOIN
    genre AS g ON t.genre_id = g.genre_id
JOIN
    invoice AS i ON il.invoice_id = i.invoice_id
WHERE
    i.billing_country != 'USA'
GROUP BY
    i.billing_country,
    g.name
ORDER BY
    total_sales DESC,
    i.billing_country;