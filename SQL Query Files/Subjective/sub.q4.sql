use chinook;

-- Finding Co-purchased Genres (Different)

SELECT 
    g1.name AS genre_1, 
    g2.name AS genre_2, 
    COUNT(*) AS times_bought_together
FROM invoice_line il1
JOIN invoice_line il2 
    ON il1.invoice_id = il2.invoice_id 
   AND il1.track_id < il2.track_id
JOIN track t1 ON il1.track_id = t1.track_id
JOIN track t2 ON il2.track_id = t2.track_id
JOIN genre g1 ON t1.genre_id = g1.genre_id
JOIN genre g2 ON t2.genre_id = g2.genre_id
WHERE g1.genre_id <> g2.genre_id
GROUP BY g1.name, g2.name
ORDER BY times_bought_together DESC
LIMIT 10;

-- Finding Co-purchased Artist (Same or different)

SELECT 
    ar1.name AS artist_1, 
    ar2.name AS artist_2, 
    COUNT(*) AS times_bought_together
FROM invoice_line il1
JOIN invoice_line il2 
    ON il1.invoice_id = il2.invoice_id 
   AND il1.track_id < il2.track_id
JOIN track t1 ON il1.track_id = t1.track_id
JOIN track t2 ON il2.track_id = t2.track_id
JOIN album al1 ON t1.album_id = al1.album_id
JOIN album al2 ON t2.album_id = al2.album_id
JOIN artist ar1 ON al1.artist_id = ar1.artist_id
JOIN artist ar2 ON al2.artist_id = ar2.artist_id
GROUP BY ar1.name, ar2.name
ORDER BY times_bought_together DESC
LIMIT 10;

    
-- Finding Co-purchased Albums
SELECT 
    al1.title AS album_1, 
    al2.title AS album_2, 
    COUNT(*) AS times_bought_together
FROM invoice_line il1
JOIN invoice_line il2 
    ON il1.invoice_id = il2.invoice_id 
   AND il1.track_id < il2.track_id
JOIN track t1 ON il1.track_id = t1.track_id
JOIN track t2 ON il2.track_id = t2.track_id
JOIN album al1 ON t1.album_id = al1.album_id
JOIN album al2 ON t2.album_id = al2.album_id
WHERE al1.album_id <> al2.album_id
GROUP BY al1.title, al2.title
ORDER BY times_bought_together DESC
LIMIT 10;
