use chinook;

SELECT
	C.customer_id,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT T.genre_id) AS number_of_genres
FROM
    invoice_line AS IL
JOIN
    invoice AS I ON IL.invoice_id = I.invoice_id
JOIN
    customer AS C ON I.customer_id = C.customer_id
JOIN
    track AS T ON IL.track_id = T.track_id
GROUP BY
    c.customer_id, c.first_name, c.last_name
HAVING
    COUNT(DISTINCT T.genre_id) >= 3;