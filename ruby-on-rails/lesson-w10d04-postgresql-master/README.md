[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

# PostGres - Up and Running

## Lesson Objectives tools

1. Instantiate a new DB directory
1. Connect to PostGres through CLI
1. Create a Database
1. Create a table
1. Insert into the table
1. Select from table
1. Update the table
1. Delete from table

<br>

## Introduction

Why are we talking about SQL?

Most applications need a [data store](https://en.wikipedia.org/wiki/Data_store)
to persist important information. A relational database is the most common
datastore for a web application. SQL is the language of relational databases.

At it's simplest, a relational database is a mechanism to store and retrieve
data in a tabular form.

Spreadsheets are a good analogy. Individual sheets as tables and the whole
spreadsheet as a database.

> Why is this important?

Database tables are a good place to store key/value pairs, as long as the values
are simple types (e.g. string, number). The keys are the column names and the
values are stored in each row. That maps well to simple JSON objects. A group of
rows from one table maps well to a JSON array.

> What about more complicated data?

Database tables can reference other tables which allows arbitrary nesting of
groups of simple types. This is something we'll be looking at more closely
later.

<br>

## Relational Database Management System ([RDBMS](http://en.wikipedia.org/wiki/Relational_database_management_system))

A **[Database
Server](http://upload.wikimedia.org/wikipedia/commons/5/57/RDBMS_structure.png)**
is a set of processes and files that manage the databases that store the tables.
Sticking with our previous analogy a database server would map to Google Sheets.

### Verb Equivalence

**[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)**
_(create, read, update and delete)_, SQL, HTTP, and Rails Controller action.

| CRUD   | SQL    | HTTP   | action     |
| :----- | :----- | :----- | :--------- |
| Create | INSERT | POST   | create     |
| Read   | SELECT | GET    | index/show |
| Update | UPDATE | PATCH  | update     |
| Delete | DELETE | DELETE | destroy    |

<br>

# ACID

ACID defines a set of rules for database transactions. These rules are built-in to our database technologies, so we don't need to worry too much about actively employing them ourselves. But knowing what they are helps provide a solid grounding for a what a database does.

What does ACID stand for:

**A - Atomicity**

- All or nothing, if one part fails, the entire transaction fails

**C - Consistency**

- Any valid transaction can only result in creating an equally valid state as defined by the various rules built by the programmer, constraints, cascades, etc. Transactions need to follow the rules inherent in the database and the validations on that data.

**I - Isolation**

- Concurrent transactions will not result invalid data. Transaction results look as though Concurrent transactions were run serially (one after another).

**D - Durability**

- The durability property ensures that once a transaction has been committed, it will remain so, even in the event of power loss, crashes, or errors. Once a change has been made, nothing but another transaction will change it.

<br>

In PostgreSQL, reviews would be a seperate entity with a `book_id` column. A review belongs to a book, a book has many reviews.

<br>

## What's a Relational Database? (10 minutes / 0:50)

<!-- AM: Whiteboard a table(s) during this section. -->

The most popular type of database is a **relational** database. How do they work?

![SQL tables](https://i.imgur.com/HjwqS4R.jpg)

_Tabular!_

**Data is stored in tables**

- These tables are organized by columns and rows, much like a spreadsheet.
- Tables are named according to what they model (e.g., `authors`, `books`).
- In the case of `authors`, each row represents one author.
- Each column is called an **attribute** or **field**, such as `id`, `title`, `birth_year`.

**Communicate via SQL (Structured Query Language)**

- SQL is a database language used specifically for relational databases.
- This is in contrast to non-relational databases (we've used Mongo) which is essentially Javascript

**Can relate data between tables**

- Hence the name _relational_ database.
- We can relate rows in the `books` table to rows in the `authors` table.
- We use a `key` to do this, which is a field that is unique for each row in a table.
- The key is often represented using an `id`, which is a unique identifier for each entry in a table. We refer to this as a `primary_key`.
- For example, to relate a book to an author we'd add a `foreign_key` field of `author_id` to our books table. The `author_id` would be the `primary_key` (or `id`) of the author the book belongs to.

<br>

## Associations

![](https://i.imgur.com/stPn9lA.png)

_via Rails Guides_

<br>

## Types of Relational Databases

There are lots of relational databases, such as PostgreSQL, MySQL, and SQLite.
They are all similar in that they use SQL, but they do have different features.

MySQL claims to be "the most popular open-source database," while PostgreSQL
claims in response to be "the most advanced open-source database". It's true
that in most tests, Postgres comes out ahead in terms of speed and has many
features MySQL lacks, such as true full-text search and handling geo-data.

If you're interested in pros and cons, check out this [article comparing MySQL,
Postgres, and SQLite](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems).

<br>

## Lab: 10 min (watch this video and read this article:)

###[SQL](https://www.khanacademy.org/computing/computer-programming/sql/sql-basics/v/welcome-to-sql)

###[Postgres](https://www.postgresql.org/about)

<br>

## Postgres Install + Troubleshoooting

<details>
	<summary>Install and Troubleshoot</summary>
	
# Getting PGSQL

### Mac

Install postgres via homebrew

```
brew install postgres
```

Start postgres

```
brew services start postgres
```

wait a few seconds to allow the service to start

```
sleep 3s
```

create database with current system username `whoami`

```
createdb
```

### Ubuntu

install postgres and build dependency

```
sudo apt-get install -y postgresql libpq-dev
```

create user in postgres with name of current system user

```
sudo -u postgres createuser "$(whoami)" -s
```

create database with name of current system
user

```
sudo -u postgres createdb "$(whoami)"
```

start postgres server

```
sudo service postgresql start
```

### Windows

```
psql -c "UPDATE pg_database SET datistemplate=FALSE WHERE datname='template1';" &> /dev/null
psql -c "DROP DATABASE template1;" &> /dev/null
psql -c "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';" &> /dev/null
psql -c "UPDATE pg_database SET datistemplate=TRUE WHERE datname='template1';" &> /dev/null
psql -c "\c template1;" &> /dev/null
psql -c "VACUUM FREEZE;" &> /dev/null
```

### Everyone

Resource bashrc

```
source ~/.bashrc
```

install postgres gem for rails

```
gem install pg
```

### Mac:

- http://postgresapp.com/
- Download
- Move it to `/Applications`
- We want to use it from the command line, so we add it to the search path.
  - `$ atom ~/.bash_profile`
  - Add this line:
    `export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin`
- save and close.
- Update your terminal.
- Then open the app and click "Open psql"
- You should see an elephant icon in the menu bar at the top of your screen.

### Linux

- `apt-get install postgresql-9.4`

### Windows (Additional)

- https://www.microfocus.com/documentation/idol/IDOL_12_0/MediaServer/Guides/html/English/Content/Getting_Started/Configure/_TRN_Set_up_PostgreSQL.htm
- v 9.5.21
- https://www.enterprisedb.com/thank-you-downloading-postgresql?anid=1257380
- normal installation next next next
- password `0000`

### All

- Verify your installation, by running `psql` in your terminal. You should see:

```
$ psql
psql (9.4.4)
Type "help" for help.

matt=#
```

```
$ psql -V
psql (9.4.4)
Type "help" for help.

matt=#
```

## Trouble Shooting

### Could not Connect to Server

If you see this when your run `psql`, you have not started the PostgresApp first.

```
$ psql
psql: could not connect to server: No such file or directory
	Is the server running locally and accepting
	connections on Unix domain socket "/tmp/.s.PGSQL.5432"?
```

### Cannot start PostgreSQL

- Symptoms:
  - PostgreSQL not running and launchctl fails with the following error:

> postgresql.plist: Operation already in progress

- Solution:

  - view the PostgreSQL Server logs for potential errors:
    `subl /usr/local/var/postgres/server.log`
  - Google the last error and fix
  - One solution I found:
    `rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres`
  - Also may need to manually delete the pid file:
    `rm /usr/local/var/postgres/postmaster.pid`

- References:
  - https://github.com/Homebrew/homebrew/issues/35240
  - http://stackoverflow.com/questions/24379373/how-to-upgrade-postgres-from-9-3-to-9-4-without-losing-data

### Cannot start psql

- Symptoms:

  - psql: FATAL: database "<user>" does not exist

- Solution:
  - Run createdb with no arguments to create a default database:
    `createdb`

### Cannot create a database

- Symptoms:

  - \$ createdb hangs / never returns

- Solution:
  - Mac OSX upgrades are known to remove empty directories under /usr/local/var which causes
    problems for PostgreSQL installations
  - To fix, run the following statements from the `bash` shell:

```
mkdir -p /usr/local/var/postgres/{pg_tblspc,pg_twophase,pg_stat_tmp}/
touch /usr/local/var/postgres/{pg_twophase,pg_stat_tmp}/.keep
pg_ctl start -D /usr/local/var/postgres
```

# Create a Database

```bash
$ createdb test1     # create a new database
$ psql test1         # connect to database

test1=# \l         # list all databases in PostgreSQL
test1=# \q         # quit
```

## Some PSQL Commands

```
\l               # list all databases
\c <database>    # connect to <database>
\d               # list all tables and other objects
\dt              # list all tables
\d <table_name>  # list details about <table_name>
\h               # show help
\q               # quit
```

## Where's all this data stored, anyway?

- Look in PostgresApp preferences. You should see `~/Library/Application\ Support/Postgres/var-9.4`. Let's take a look in there.
- We see `postgres-server.log`
- Check out a file within `global/`. What is THAT?
  - This is binary (not text) data, spread out across multiple files
- [More info](http://www.postgresql.org/docs/9.0/static/storage-file-layout.html)

</details>

<br>

## Instantiate a new DB directory

If using the OSX app that https://www.postgresql.org/ provides, you can tell it where to store its data:

```sql
initdb -D ~/Desktop/postgres_db/ - create the directory
postgres -D ~/Desktop/postgres_db/ - start postgres, using that directory
```

If you used homebrew to install, use

```
postgres -D /usr/local/var/postgres/
```

<br>

## Connect to PostGres through CLI

If using the OSX app that https://www.postgresql.org/ provides, you can list sub dbs from the terminal:

```sql
psql -l -- list all subdatabses
psql db_name -- start psql app, using the sub database db_name
```

Once inside the `psql` app, you can list the sub databases like this:

```sql
\l
```

<br>

## Create a Database

Like MongoDB, Postgres has "sub-databases":

```SQL
CREATE DATABASE foo; -- create the sub database foo
DROP DATABASE foo; -- drop it
CREATE DATABASE test_db;
\connect test_db; -- connect to the test_db sub database
```

<br>

## Data types

Postgres has the following data types:

1. int - whole number
1. decimal - float/decimal
1. bool - boolean
1. varchar(n) - small text
1. text - large text
1. timestamp - date

<br>

## Create a table

- Instead of collections, we have tables, which are just like a spreadsheet, or grid. Rows are entries, and columns are properties of each row.
- Unlike MongoDB, you have to tell Postgres, what data type each column is. It's very 'strict'

```sql
CREATE TABLE foo ( name varchar(20) ); -- create a table called 'foo' with one column called 'name' which is a small text column
\dt -- describe your tables
DROP TABLE foo; -- drop a table
CREATE TABLE users ( id serial, name varchar(20), age int, email varchar(32) ); -- 'test' table has an id column, which is just a number, and a name column
\d users; -- describe the columns of the test sub database
```

<br>

## Insert into the table

```sql
INSERT INTO users ( name, age, email ) VALUES ( 'Matt', 36, 'matt.huntington@generalassemb.ly'); -- create a row
```

<br>

## Select from table

```sql
SELECT name FROM users; -- select all rows from the users table.  display only the name column
SELECT * FROM users; -- select all rows from the users table.  display only the all columns
SELECT * FROM users WHERE name = 'Matt'; -- select all rows from the user table where the name column is set to 'Matt'
SELECT * FROM users WHERE name LIKE '%Matt%'; -- select all rows from the user table where the name column contains 'Matt'
SELECT * FROM users WHERE name = 'Matt' AND email = 'matt.huntington@generalassemb.ly'; -- select all rows from the user table where the name column is set to 'Matt' AND the email column is set to matt.huntington@generalassemb.ly
SELECT * FROM users WHERE name = 'Matt' OR email = 'matt.huntington@generalassemb.ly'; -- select all rows from the user table where either the name column is set to 'Matt' OR the email column is set to matt.huntington@generalassemb.ly
SELECT * FROM users WHERE age = 36; -- select all rows from the user table where the age column is set to 36
SELECT * FROM users WHERE age != 16; -- select all rows from the user table where the age column is not set to 16
SELECT * FROM users WHERE age > 26; -- select all rows from the user table where the age column is greater than 26
SELECT * FROM users WHERE age < 46; -- select all rows from the user table where the age column is less than 26
SELECT * FROM users WHERE age <= 36; -- select all rows from the user table where the age column is less than or equal to 36
SELECT * FROM users WHERE age >= 36; -- select all rows from the user table where the age column is greater than or equal to 36
SELECT * FROM users WHERE age IS NULL; -- select all rows from the user table where the age column has no value
SELECT * FROM users WHERE age IS NOT NULL; -- select all rows from the user table where the age column has any value
```

<br>

## Update the table

```sql
UPDATE users SET name = 'Matthew' WHERE id = 1; -- update the users table.  Set the name column to 'Matthew' for every row that has the id column set to 1
```

<br>

## Delete from table

```sql
DELETE FROM users WHERE id = 1; -- delete all rows from the users table that have the id column set to 1
```

<br>

## LABTIME

- [sql-library-lab](./exercises/sql-library-lab)
- [sql-computers-lab](./exercises/sql-computers-lab)

<br>

## Part 2 - Lesson Objectives

1. Alter a table
1. Limit
1. Sorting
1. Aggregation
1. Joins

<br>

## Alter a table

```sql
ALTER TABLE users ADD COLUMN test VARCHAR(20); -- add an test string column
ALTER TABLE users DROP COLUMN test; -- drop the test column
ALTER TABLE users RENAME name TO first_name -- rename a column
ALTER TABLE users ADD COLUMN id serial PRIMARY KEY; -- add an id column that increments with each new row
ALTER TABLE users RENAME TO people; -- rename a table
ALTER TABLE people ALTER COLUMN first_name TYPE text; -- chang the data type of a column
```

<br>

## Limit

```sql
SELECT * FROM people LIMIT 1; -- select all rows from people table, but show only the first column
SELECT * FROM people LIMIT 1 OFFSET 1; -- select all rows from people table, but show only one column.  Skip the first row
```

<br>

## Sorting

```sql
SELECT * FROM people ORDER BY first_name ASC; -- select all rows from people table, order by name alphabetically
SELECT * FROM people ORDER BY first_name DESC; -- select all rows from people table, order by name reverse alphabetically
SELECT * FROM people ORDER BY age ASC; -- select all rows from people table, order by age ascending
SELECT * FROM people ORDER BY age DESC; -- select all rows from people table, order by age descending
```

<br>

## Aggregation

```sql
SELECT SUM(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the SUM of the ages of each group.  Also show what name each group has
SELECT AVG(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the AVG of the ages of each group.  Also show what name each group has
SELECT MIN(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the MAX of the ages of each group.  Also show what name each group has
SELECT MAX(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the MIN of the ages of each group.  Also show what name each group has
SELECT COUNT(age), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show how many rows have a value in the age column.  Also show what name each group has
SELECT COUNT(*), first_name FROM people GROUP BY first_name; -- divide all rows into groups by name.  Show the number of rows in each group.  Also show what name each group has
SELECT array_agg(first_name), age FROM people GROUP BY age; -- divide all rows into groups by age.  List the names in each group and show what age each group has
```

<br>

## JOINS

Before running the below commands...

- Create a `companies` table with `id` and `name`
- Add `employer_id` to the `people` table

<br>

```sql
SELECT * FROM people CROSS JOIN companies;
SELECT * FROM people JOIN companies ON people.employer_id = companies.id -- find all people who have an employer_id column set and show which company they work for
SELECT * FROM people LEFT JOIN companies ON people.employer_id = companies.id -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all people who do not have an employer_id column set
SELECT * FROM people RIGHT JOIN companies ON people.employer_id = companies.id -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all companies who do not have any people with employer_id columns set to the company's id column
SELECT * FROM people FULL OUTER JOIN companies ON people.employer_id = companies.id; -- find all people have an employer_id column set and show which company they work for.  In addition to this set, add on all companies who do not have any people with employer_id columns set to the company's id column and all people who do not have an employer_id column set
```

<br>

# Part 3 - SQL JOINs

## Learning Objectives

- Define what a foreign key is
- Describe how to represent a one-to-many relationship in SQL database
- Explain how to represent one-to-one and many-to-many relationships in a SQL DB
- Distinguish between keys, foreign keys, and indexes
- Describe the purpose of the JOIN
- Use JOIN to combine tables in a SELECT
- Describe what it means for a database to be normalized

## Introduction

One of the key features of relational databases is that they can represent relationships between rows in different tables.

Going back to our library example, we have two tables: `books` and `authors`. Our goal now is to somehow indicate the relationship between a book and an author. In this case, that relationship indicates who wrote the book.

You can imagine that we'd like to use this information in a number of ways, such as...

- Getting the author information for a given book.
- Getting all books written by a given author.
- Searching for books based on attributes of the author (e.g., all books written by an American author).

## One-to-Many (10 minutes / 2:20)

How might we represent this information in our database? For this example,
let's assume that each book has only one author (even though that's not always
the case in the real world.)

#### Option 1 - Duplicate Info (Wrong)

**authors**

- name
- nationality
- birth_year

**books**

- title
- pub_date
- author_name
- author_nationality
- author_birth_year

**Downside**: duplication, keeping data in sync.

#### Option 2 - Array of IDs (Wrong)

**authors**

- name
- nationality
- book_ids

**books**

- title
- pub_date

**Downside**: Parsing list, can't index (for speed!)

#### Option 3 (Correct!)

**authors**

- name
- nationality

**books**

- title
- pub_date
- author_id

![one_to_many](https://i.imgur.com/MKde2sH.png)

<br>
x
## WE DO

Describe the following relationships. Which table would contain the foreign key?

- Author, Blog
- Recipe, Ingredient
- Make, Model (car)

<br>

## Joins

To SELECT information on two or more tables at ones, we can use a JOIN clause.
This will produce rows that contain information from both tables. When JOINing
two or more tables, we have to tell the database how to 'match up' the rows.
(e.g. to make sure the author information is correct for each book).

This is done using the ON clause, which specifies which properties to match.

### Writing SQL JOINS

```sql
SELECT id FROM authors where name = 'J.K. Rowling';
SELECT * FROM books where author_id = 2;

SELECT * FROM books JOIN authors ON books.author_id = authors.id;
```

- primary key - `authors.id`
- foreign key - `books.author_id`
- be specific - name the databaseName.dataTable

```sql
SELECT * FROM books JOIN authors ON books.author_id = authors.id WHERE authors.nationality = 'United States of America';
```

### Alaises

You can also simplify your SQL queries using AS to create an alias.

```sql
SELECT * FROM books JOIN authors ON books.author_id = authors.id;

// would become

SELECT * FROM books AS b JOIN authors AS a ON b.author_id = a.id;
```

<br>

## You Do: Less Common Joins

There are actually a number of ways to join multiple tables with `JOIN`, if
you're really curious, check out this article:

[A visual explanation of SQL Joins](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)

<br>

## Homework: Books and Authors

See exercise in the [sql-library-lab](./exercises/sql-library-lab) exercise.

<br>

## References and links

- [SQL vs NoSQL](http://dataconomy.com/sql-vs-nosql-need-know/)
- [To SQL or NoSQL? That’s the database question](http://arstechnica.com/information-technology/2016/03/to-sql-or-nosql-thats-the-database-question/)
- [SQLite vs MySQL vs PostgresQL](https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems)
- [A beginners guide to SQL](http://www.sohamkamani.com/blog/2016/07/07/a-beginners-guide-to-sql/)
- [Khan Academy: Intro to SQL](https://www.khanacademy.org/computing/computer-programming/sql)
- [SQL Zoo](http://sqlzoo.net/)
- http://sqlfiddle.com/#!15/35773/1
- https://pgexercises.com/
- https://www.sqlteaching.com/#!select
- https://sqlbolt.com/lesson/select_queries_introduction

## Sample Quiz Questions

- What is an ERD and why would we use one?
- What is the distinctive feature of a relational database?
- How is information stored in a relational database?
- What are the different types of relations that exist in a relational database?
- How do we indicate a one-to-many relationship in a database?
