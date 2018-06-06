# Analysing the Chinook Database using SQLite and R

This example uses the [Chinook Database](https://github.com/lerocha/chinook-database "null") which represents a hypothetical a digital media store, including tables for artists, albums, media tracks, invoices and customers. We chose it for this example because it:

-   is relatively small, so doesn't bloat the examples repo
-   has several tables, so is good for illustraing joins
-   is freely available!

Let's start by querying the `sqlite_master` table to get a list of the tables in the database,

```sql
SELECT name FROM sqlite_master WHERE type='table'
```

We can also inspect the structure of each table by looking at the `sql` column,

```sql
SELECT sql FROM sqlite_master WHERE name IN ('Album', 'Artist')
```

OK, so lets look at the top ten artists in terms of numbers of albums,

```sql
SELECT Name, count(AlbumId) AS Albums
FROM Artist LEFT JOIN Album ON Artist.ArtistId=Album.ArtistId
GROUP BY Name
ORDER BY Albums DESC
LIMIT 10
```

What are the most common first letters for album titles? Let's count the number of albums having each first letter using SQL and then plot the result in R.
We want to save the result of the SQL query and in Stencila we can do it by simply assigning the result to a variable `albums_per_letter`:

```sql
albums_per_letter =
SELECT substr(Title,1,1) AS Letter, count(AlbumId) AS Albums
FROM Album
GROUP BY Letter
```

Now we can use the variable `albums_per_letter` in R code:

```r
ggplot(albums_per_letter, aes(x=Letter, y=Albums)) + geom_bar(stat='identity')
```
