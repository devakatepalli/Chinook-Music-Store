use chinook;

-- Top selling tracks in USA
SELECT 
    t.name AS track_name,
    a.title AS album_title,
    ar.name AS artist_name,
    g.name AS genre,
    SUM(il.quantity) AS total_sold,
    SUM(il.unit_price * il.quantity) AS revenue
FROM invoice i
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE i.billing_country = 'USA'
GROUP BY t.track_id, t.name, a.title, ar.name, g.name
ORDER BY revenue DESC
LIMIT 5;

-- Top artist in USA with most famous genre
SELECT 
    ar.name AS artist_name,
    g.name AS genre,
    SUM(il.unit_price * il.quantity) AS revenue
FROM invoice i
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE i.billing_country = 'USA'
GROUP BY ar.artist_id, ar.name, g.name
ORDER BY revenue DESC
LIMIT 1;