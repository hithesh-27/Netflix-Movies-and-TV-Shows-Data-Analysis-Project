-- Netflix Project

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
      show_id	VARCHAR(6),
      type	    VARCHAR(10),
      title	    VARCHAR(150),
      director	VARCHAR(210),
      casts	    VARCHAR(1000),
      country	VARCHAR(150),
      date_added VARCHAR(50),	
      release_year	INT,
      rating	VARCHAR(10),
      duration	VARCHAR(15),
      listed_in	 VARCHAR(100),
      description  VARCHAR(300)
);

select * from netflix;

select count(*) as total_content from netflix;

select distinct type from netflix;

-- 15 Business problems --

-- 1. Count the number of Movies vs TV Shows

SELECT type,count(*) as total_content
FROM netflix
group by type;

-- 2. Find the most common rating for movies and TV Shows

select type,rating
from 
(SELECT type,rating,count(*) as total_count,
RANK() OVER(PARTITION by type order by count(*) DESC) as Ranking
from netflix
group by 1,2)as t1
where Ranking=1;

-- 3. List all movies released in a specific year (e.g 2020)

SELECT * from netflix where release_year=2020 and type='Movie';

-- 4. Find the top 5 countries with the most content on Netflix

select  TRIM(UNNEST(STRING_TO_ARRAY(country,','))) as new_country,count(show_id)
from netflix
group by 1
order by 2 desc
limit 5;

-- 5. Identify the longest movie?

SELECT * from netflix
where type='Movie' and duration like '%min'
order by cast(split_part(duration,' ',1) as int) desc
limit 1;


-- 6 Find the content added in the last 5 years

select * from netflix
WHERE to_date(date_added,'Month-DD-YYYY')>=CURRENT_DATE - INTERVAL'5 years'


-- 7. Find all the movies/TV Shows by director 'Rajiv Chilaka'

select * from netflix where director ilike '%Rajiv Chilaka%';


-- 8. List all TV shows with more than 5 seasons

select * from netflix where type='TV Show' and duration like '%Seasons'
and  cast(split_part(duration,' ',1) as INT)>5
order by cast(split_part(duration,' ',1) as INT) Desc;


-- 9. Count the number of content items in each genre

select 
TRIM(UNNEST(STRING_TO_ARRAY(listed_in,','))) AS genre,
count(show_id) as total_count
from netflix
group by 1 ;


-- 10. Find each year and the average numbers of content release by India on netflix,
-- return top 5 year with highest avg content release

select 
extract(year from to_date(date_added,'Month, DD, YYYY')) as year,
count(*) as yearly_content,
ROUND(count(*)::numeric/(select count(*) from netflix where country='India')*100,2) as avg_content_per_year
from netflix
where country='India'
group by 1;


-- 11. list all movies that are documentaries

select * from netflix where type='Movie' and listed_in ilike '%documentaries%';


-- 12. Find all the content without a director

select * from netflix where director is null;


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years

select * from netflix
where casts ilike '%salman khan%'
and 
release_year >=extract(year from current_date)-10


-- 14. Find the top 10 actors who have appeared in the highest number of movies
-- produced in India

select
trim(unnest(string_to_array(casts,','))) as actors,
count(*) as total_content
from netflix
where country ilike '%india%'
group by 1
order by 2 desc
limit 10;


-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence'
-- in the description field.Label content containing these keywords as 'Bad' and all other
-- content as 'Good' . Count how many items fall into each category


with new_table
as
(
select *,
       case
	   when
	         description ilike '%kill%' or
			 description ilike '%violence' then 'bad_content'
	   else 
	         'good_content'
	   end as category
from netflix
)

select
       category,
	   count(*) as total_content
from new_table
group by 1