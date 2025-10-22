use chinook;

-- Genre Sales Analysis
SELECT
    G.name AS genre_name,
    SUM(IL.quantity * IL.unit_price) AS genre_sales,
    (
        SELECT SUM(IL2.quantity * IL2.unit_price)
        FROM invoice_line AS IL2
        JOIN invoice AS I2 ON IL2.invoice_id = I2.invoice_id
        JOIN customer AS C2 ON I2.customer_id = C2.customer_id
        WHERE C2.country = 'USA'
    ) AS total_usa_sales,
    (SUM(IL.quantity * IL.unit_price) / (
        SELECT SUM(IL3.quantity * IL3.unit_price)
        FROM invoice_line AS IL3
        JOIN invoice AS I3 ON IL3.invoice_id = I3.invoice_id
        JOIN customer AS C3 ON I3.customer_id = C3.customer_id
        WHERE C3.country = 'USA'
    )) * 100 AS percentage_of_total_sales
FROM
    invoice_line AS IL
JOIN
    track AS T ON IL.track_id = T.track_id
JOIN
    genre AS G ON T.genre_id = G.genre_id
JOIN
    invoice AS I ON IL.invoice_id = I.invoice_id
JOIN
    customer AS C ON I.customer_id = C.customer_id
WHERE
    C.country = 'USA'
GROUP BY
    G.name
ORDER BY
    percentage_of_total_sales DESC;
    
    
-- Best Selling Artists

SELECT
    A.name AS artist_name,
    SUM(IL.quantity * IL.unit_price) AS artist_sales
FROM
    invoice_line AS IL
JOIN
    track AS T ON IL.track_id = T.track_id
JOIN
    album AS AL ON T.album_id = AL.album_id
JOIN
    artist AS A ON AL.artist_id = A.artist_id
JOIN
    invoice AS I ON IL.invoice_id = I.invoice_id
JOIN
    customer AS C ON I.customer_id = C.customer_id
WHERE
    C.country = 'USA'
GROUP BY
    A.name
ORDER BY
    artist_sales DESC;