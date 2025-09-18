# Netflix-Movies-and-TV-Shows-Data-Analysis-Project


📝 Project Overview

This project analyzes the Netflix Movies and TV Shows dataset (imported from Kaggle) using PostgreSQL.
The goal is to answer 15 real-world business questions about Netflix’s content library, such as content trends, most common genres, top actors, countries producing the most content, and classification of content as "Good" or "Bad" based on description keywords.


---

⚙ Tools & Dataset

Database: PostgreSQL

Dataset: Netflix Movies and TV Shows dataset from Kaggle

Language: SQL



---

🔍 Business Problems Solved

1. Count the number of Movies vs. TV Shows.


2. Find the most common rating for Movies and TV Shows.


3. List all Movies released in a specific year (e.g., 2020).


4. Find the top 5 countries with the most Netflix content.


5. Identify the longest movie.


6. Find content added in the last 5 years.


7. List all Movies/TV Shows directed by Rajiv Chilaka.


8. List all TV Shows with more than 5 seasons.


9. Count the number of content items in each genre.


10. Find each year and the average number of content releases from India (Top 5 years).


11. List all Movies that are Documentaries.


12. Find all content without a director.


13. Find how many Movies actor Salman Khan appeared in during the last 10 years.


14. Find the Top 10 actors who appeared in the most Movies produced in India.


15. Categorize content as Good or Bad based on the presence of keywords ("kill" / "violence") in descriptions, and count how many items fall into each category.




---

📂 Project Structure

├── netflix_project.sql     # All SQL queries (Table creation + 15 business queries)
├── README.md               # Project documentation


---

📈 Key Insights

TV Shows generally have fewer ratings categories compared to Movies.

The USA and India are among the top contributors to Netflix’s content library.

The most common genre is International Movies.

A significant portion of content has missing director information.

Recursive and window functions help solve ranking and time-based queries.



---

🚀 How to Run the Project

1. Install PostgreSQL.


2. Import the dataset into a PostgreSQL database.


3. Run the queries from netflix_project.sql.


4. Analyze the results to gain business insights.




---

🌟 Future Work

Build Power BI/Tableau dashboards for visualization.

Apply Machine Learning models for content recommendation.

Perform trend analysis (year-over-year growth, genre popularity, etc.).



---

👉 This project demonstrates SQL skills such as:

Window functions (RANK(), OVER)

String functions (SPLIT_PART, TRIM, UNNEST)

Date functions (TO_DATE, EXTRACT, INTERVAL)

CTEs (Common Table Expressions)

Aggregations (COUNT, GROUP BY)



---


