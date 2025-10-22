use chinook;

-- Missing Values or not
select * from Employee;
select * from customer;
select * from invoice;
select * from invoice_line;
select * from track;
select * from playlist_track;
select * from playlist;
select * from album;
select * from artist;
select * from media_type;
select * from genre;

-- EMPLOYEE: Duplicates
SELECT employee_id, COUNT(*) AS dup_count
FROM employee
GROUP BY employee_id
HAVING COUNT(*) > 1;

-- CUSTOMER: Duplicates
SELECT customer_id, COUNT(*) AS dup_count
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- INVOICE: Duplicates
SELECT invoice_id, COUNT(*) AS dup_count
FROM invoice
GROUP BY invoice_id
HAVING COUNT(*) > 1;

-- INVOICE_LINE: Duplicates
SELECT invoice_line_id, COUNT(*) AS dup_count
FROM invoice_line
GROUP BY invoice_line_id
HAVING COUNT(*) > 1;

-- TRACK: Duplicates
SELECT track_id, COUNT(*) AS dup_count
FROM track
GROUP BY track_id
HAVING COUNT(*) > 1;

-- PLAYLIST: Duplicates
SELECT playlist_id, COUNT(*) AS dup_count
FROM playlist
GROUP BY playlist_id
HAVING COUNT(*) > 1;

-- PLAYLIST_TRACK: Duplicates
SELECT playlist_id, track_id, COUNT(*) AS dup_count
FROM playlist_track
GROUP BY playlist_id, track_id
HAVING COUNT(*) > 1;

-- ALBUM: Duplicates
SELECT album_id, COUNT(*) AS dup_count
FROM album
GROUP BY album_id
HAVING COUNT(*) > 1;

-- ARTIST: Duplicates
SELECT artist_id, COUNT(*) AS dup_count
FROM artist
GROUP BY artist_id
HAVING COUNT(*) > 1;

-- GENRE: Duplicates
SELECT genre_id, COUNT(*) AS dup_count
FROM genre
GROUP BY genre_id
HAVING COUNT(*) > 1;

-- MEDIA_TYPE: Duplicates
SELECT media_type_id, COUNT(*) AS dup_count
FROM media_type
GROUP BY media_type_id
HAVING COUNT(*) > 1;

SET SQL_SAFE_UPDATES = 0;
-- Dealing with missing values
UPDATE customer
SET 
    company = 'N/A'
WHERE company IS NULL;

UPDATE customer
SET 
    state = 'N/A'
WHERE state IS NULL;

UPDATE customer
SET 
    postal_code = 'N/A'
WHERE postal_code IS NULL;

UPDATE customer
SET 
    fax = 'N/A'
WHERE fax IS NULL;

UPDATE track
SET composer = 'Unknown'
WHERE composer IS NULL;

UPDATE Employee
SET 
    reports_to = 0
WHERE reports_to IS NULL;






