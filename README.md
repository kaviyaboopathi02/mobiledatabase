**mobile database**

Project Description;

The project focuses on building and managing a relational database system to store and manipulate information about movies, actors, directors, reviews, and genres. It demonstrates the use of SQL features such as table creation, data insertion, queries (including subqueries and joins), and stored procedures. This system allows users to retrieve and manage movie-related information efficiently.

Tool Used;

MySQL
The database management system used to create and manage the relational database, including tables, constraints, stored procedures, and queries.

Tables Used;
movie:
Stores information about movies, including movie ID, name, title, release year, director ID, and actor ID.

actor:
Stores information about actors, including actor ID, name, and associated movie ID.

director:
Stores information about directors, including director ID, name, and associated movie ID.

reviews_s:
Stores reviews for movies, including review ID, movie ID, reviewer name, review text, and rating.

genres:
Stores genres associated with movies, including movie ID and genre name.

Queries Used
Insert Queries:
Populates the movie, actor, director, reviews_s, and genres tables with sample data.

Select Queries:

View all data from tables (e.g., SELECT * FROM movie;).
Fetch details of movies with specific conditions (e.g., movies with ratings above 50).
Use subqueries to find related information (e.g., genres of movies reviewed highly).
Joins:

Combine data across tables to create meaningful outputs:
Reviews with genre names.
Movies with actor details.
Update Queries:

Update director names.
Modify review ratings for movies released after 2010.
Stored Procedures:

GetHighRatedMovies: Fetches movies with a rating above a given threshold.
AddActor: Inserts a new actor into the database.
GetActorsByMovie: Retrieves actors for a specific movie.
How to Use
Database Setup:

Create the database using CREATE DATABASE movies;.
Use the database with USE movies;.
Table Creation:

Run the CREATE TABLE statements to create all required tables with appropriate primary and foreign key constraints.
Insert Data:

Populate the tables with sample data using the provided INSERT statements.
Query the Data:

Run the provided SELECT queries to retrieve data from tables.
Use joins to combine and analyze data from multiple tables.
Stored Procedures:

Use CALL statements to execute stored procedures for specific tasks such as:
Fetching high-rated movies.
Adding a new actor.
Finding actors in a specific movie.
Update Data:

Modify existing data using UPDATE queries to reflect changes, such as director names or review ratings.
Key Highlights
Normalized Schema: Tables are well-structured with appropriate foreign keys, ensuring data integrity.
Stored Procedures: Automate repetitive tasks like fetching data or inserting new entries.
Complex Queries: Leverage joins and subqueries to derive insights from the database.
This project provides a robust foundation for managing and querying movie-related data, ideal for learning or small-scale applications.






