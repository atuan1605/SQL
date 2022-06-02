### EX1
```SQL
SELECT m.title AS title, m.description AS description, d.full_name AS director, JSON_ARRAYAGG(w.full_name) AS writers, 
		m.length, m.rating
FROM movie m INNER JOIN director d ON m.id_director = d.id
INNER JOIN movie_writers mw ON m.id = mw.id_movie
INNER JOIN writers w ON mw.id_writer = w.id
INNER JOIN title_type tt ON tt.id = m.id_title_type
WHERE tt.name LIKE "Movie"
GROUP BY m.id
```

![image](image/Screen%20Shot%202022-05-31%20at%2019.05.16.png)

### EX2
```sql
SELECT m2.name, COUNT(m.id)
FROM movie m INNER JOIN movie_manufacturer mm ON m.id = mm.id_movie
INNER JOIN manufacturer m2 ON m2.id = mm.id_manufacturer
GROUP BY m2.id
```

![image](image/Screen%20Shot%202022-05-31%20at%2019.13.54.png)

### EX3
```sql
SELECT m.title
FROM movie m INNER JOIN title_type tt ON m.id_title_type = tt.id
WHERE tt.name LIKE "TV Series"
AND m.episode = m.current_episode
```
![image](image/Screen%20Shot%202022-06-01%20at%2017.13.18.png)


### EX4
```sql
SELECT m.title, t.link
FROM movie m INNER JOIN movie_trailer mt ON m.id = mt.id_movie
INNER JOIN trailer t ON mt.id_trailer = t.id
WHERE mt.status = 'active'
```

![image](image/Screen%20Shot%202022-06-01%20at%2017.20.38.png)

### EX5

```sql
SELECT m.title, m.description, m.poster, m.length, m.imdb
FROM movie m 
ORDER BY m.imdb DESC
```

![image](image/Screen%20Shot%202022-06-01%20at%2017.30.32.png)

### EX6
```sql
SELECT m.title, m.description, m.poster, m.length, json_arrayagg(g.name) AS genres, m.episode, m.current_episode
FROM movie m INNER JOIN movie_genres mg ON m.id = mg.id_movie
INNER JOIN genres g ON mg.id_genres = g.id
INNER JOIN title_type tt ON m.id_title_type = tt.id
WHERE tt.name LIKE 'TV mini Series'
GROUP BY m.id
ORDER BY m.release_date DESC
```

![image](image/Screen%20Shot%202022-06-01%20at%2017.45.14.png)

### EX7
```sql
SELECT m.title, m.description, d.full_name AS director, json_arrayagg(w.full_name) AS writers, m.poster, m.length, json_arrayagg(g.name) AS genres
FROM movie m INNER JOIN director d ON m.id_director = d.id
INNER JOIN movie_writers mw ON m.id = mw.id_movie
INNER JOIN writers w ON mw.id_writer = w.id
INNER JOIN movie_genres mg ON m.id = mg.id_movie
INNER JOIN genres g ON mg.id_genres = g.id
INNER JOIN movie_actor ma ON m.id = ma.id_movie
INNER JOIN actor a ON a.id = ma.id_actor
GROUP BY m.id
ORDER BY m.imdb DESC 
LIMIT 10
```

![image](image/Screen%20Shot%202022-06-01%20at%2017.48.58.png)