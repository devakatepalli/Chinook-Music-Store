use chinook;

-- Best_Selling Genres in the USA
SELECT
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
    i.billing_country = 'USA'
GROUP BY
    g.name
ORDER BY
    total_sales DESC
LIMIT 3;

-- Best_Selling Albums within Top Genres

SELECT
    a.title AS album_title,
    ar.name AS artist_name,
    SUM(il.quantity * il.unit_price) AS total_sales
FROM
    invoice_line AS il
JOIN
    track AS t ON il.track_id = t.track_id
JOIN
    genre AS g ON t.genre_id = g.genre_id
JOIN
    invoice AS i ON il.invoice_id = i.invoice_id
JOIN
    album AS a ON t.album_id = a.album_id
JOIN
    artist AS ar ON a.artist_id = ar.artist_id
WHERE
    i.billing_country = 'USA' AND g.name IN ('Rock', 'Alternative & Punk', 'Metal')
GROUP BY
    a.title, ar.name
ORDER BY
    total_sales DESC
LIMIT 3;