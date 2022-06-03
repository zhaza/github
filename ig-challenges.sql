DESC users;
DESC photos;
DESC likes;
DESC photo_tags;
DESC tags;

SELECT * FROM users
ORDER BY created_at LIMIT 5;

SELECT 
	DATE_FORMAT(created_at, '%W') AS DAY,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC LIMIT 1;

SELECT 
	username
FROM users 
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id IS NULL;

SELECT 
	username,
    photos.id,
    image_url,
	COUNT(*) AS total
FROM photos
JOIN likes
	ON likes.photo_id = photos.id
JOIN users
	ON users.id = photos.user_id
GROUP BY photo_id
ORDER BY total DESC LIMIT 1;

SELECT 
(SELECT Count(*) FROM photos)
/
(SELECT Count(*) FROM users) AS avg;

SELECT
    tags.tag_name,
    COUNT(*) as total
FROM photo_tags
JOIN tags
	ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC LIMIT 5;

SELECT
	users.username,
    COUNT(*) AS num_likes
FROM users
JOIN likes
	ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*)FROM photos);