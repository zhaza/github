SELECT title, rating
FROM series
JOIN reviews
	ON series.id = reviews.series_id;
    
SELECT
	title,
    AVG(rating) AS avg_rating
FROM series
JOIN reviews
	ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

SELECT first_name, last_name, rating
FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id;

SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
	ON series.id = reviews.series_id
WHERE rating IS NULL;

SELECT genre, ROUND(AVG(rating),2) AS rating
FROM series JOIN reviews
	ON series.id = reviews.series_id
GROUP BY genre;

SELECT 
	first_name,
    last_name,
    COUNT(first_name AND last_name) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    IFNULL(ROUND(AVG(rating), 2), 0) AS AVG,
	CASE
		WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
	END AS 'STATUS'
FROM reviewers LEFT JOIN reviews
	ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;

SELECT 
	title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM series 
JOIN reviews
	ON series.id = reviews.series_id
JOIN reviewers
	ON reviews.reviewer_id = reviewers.id
ORDER BY title;
    
SELECT * FROM series;
SELECT * FROM reviews;
SELECT * FROM reviewers;