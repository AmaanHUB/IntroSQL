# Introduction to SQL

## Introduction To Databases

### What Is A Database?

* Structured set of data
	* With tables to keep various pieces of data

### Tables

Consists of columns (with column headers) and rows.

* Column - Correspond to the attributes of the object
* Row - One set of attributes to one instance that a table describes. AKA records or tuples
* Table - Predefined at of rows and columns that defines an entity. AKA a file
* DBMS - Data Base Management System allows a computer to perform functions of storing, retrieving, adding etc the data.

### Type of Databases

* Flat-file - Stores everything in one table, like an excel spread sheet
* Relational Database - Many tables, linked to each other through keys
* Big Data - MongoDB etc, data analytics etc

### Relationship Types
* One to One
	* One row in Table A is linked to no more than one row in Table B
* One to Many
	* Each row in one table can be related to many rows in the other table
* Many to Many
	* Many rows to many rows from one table to another
	* Third table called a mapping or link table is required to implement this through


### Keys

* Primary Key:
	* Uniquely identifies each record in the table
	* Each table can have more than one column which is part of its ptimary key (composite key) .e.g. order no. + order line no.
	* Can either be a guaranteed unique attribute (.e.g. NI number) or generated by DBMS
	* Must always have an entry
	* Value must never change
	* May have a maximum of 1 in each table

* Foreign Key:
	* Primary key in a in a secondary table (builds the relationship to the primary table)
	* Can repeat many times
	* No uniqueness constraint
	* Prevent actions that would destroy links between tables

### Database Tools

* SQL Server Editions
* PostgreSQL
* SQLite
* MySQL
* Redis
* MongoDB


### SQL (Structured Query Language)
* DML (data manipulation language)
	* SELECT etc.
* DDL (data definition language)
	* CREATE etc.
* DCL (data control language)
	* GRANT, REVOKE etc.
* TCL (transaction control language)
	* COMMIT etc.

#### Some Commands

* Create database:
```
CREATE DATABASE my_db;
```

* Use a database:
```
use my_db;
```

* Create a table with two columns that can accept characters of 10 and 6 length:
```
CREATE TABLE table_name(
	column_one VARCHAR(10),
	column_two VARCHAR(6)
	);
```

* Information about a table:
```
SP_HELP table_name
```

* Delete table:
```
DROP table_name
```

* Add column to table:
```
ALTER TABLE table_name
ADD column_name data_type;
```

* Insert into table:
```
INSERT INTO table_name(
	column_one, column_two
)
VALUES(
	value1, value2
);
```
N.B. VARCHAR, CHAR and DATA use quotes for their values, but not the number ones

* Update contents of table:
```
UPDATE table_name
	SET column = value					// .e.g. person_name to change to
	WHERE column_two > something;  		//Some expression like person_id = 2, to get specific person
```

* Delete contents from table (same format as UPDATE):
```
DELETE FROM table_name
	WHERE column > something;		// Some expression here
```

* Null value:
```
...
	column_two VARCHAR(10) NOT NULL,
...
```

* Primary key set (IDENTITY is auto increment):
```
...
	person_id INT NOT NULL IDENTITY PRIMARY KEY,
...
```

* Foreign key set:
```
...
column_name data_type REFERENCES table_name(other_column_name)

```




### Data Types
* VARCHAR (basically Strings):
	* String, specify the max amount of length used
	* VARCHAR(MAX)
* CHAR or CHARACTERS:
	* Fixed length and amount of space used
* INT:
	* Positive or negative
* DATE or TIME or DATETIME:
	* Stores date, time, or both.
	* 'YYYYMMDD' format
* DECIMAL or NUMERIC:
	* Show number digits to be stored on both side of the decimal places, can be used interchangably
* BINARY:
	* Stores binary data as an image or file
* FLOAT:
	* Scientific and very large numbers
* BIT:
	* Equivalent to binary (0, 1, or NULL)
* NULL:
	* Undefined value, absence of something
	* Used 	data integrity reasons
	* Standard practice


### Normal Forms
'Normal Forms' are best practices for designing databases. See the first three types below:

* 1st Normal Form:
	* Everything is atomic (data presented as small as possible)
		* .e.g. field for first name and surname
	* No repeating groups (same attribute not more than once)
		* .e.g. if more than one colour for one product ID, maybe have another table just for the colours to refer to the product ID
* 2nd Normal Form:
	* Must be in 1NF
	* All non-key attributes should be relevant to the primary key
	* Single column primary key
* 3rd Normal Form:
	* Must be in 2NF
	* No transitive functional dependency -
		* when a non-key column is functionally dependent on another key column, which is functionally dependent on the primary key. ONLY DEPENDS ON THE PRIMARY KEY
			* Only want to update one table if changing relevant information


### Using SQL As A ...
#### Tester
* Getting data for testing
* Saving data, generated during testing activity
* Data verification in databases
	* Find data
	* To ensure data integrity
	* Manipulate test data for specific tests

#### DevOps
* Environments need databases
* Need to look over
* Same data verifications
* Testing databases

### Querying An SQL Database
```
SELECT column_one, column_two FROM table_name, WHERE condition
```
In order of syntax:
* SELECT
* DISTINCT (.e.g. COUNT/Unique etc)
* FROM
* WHERE
* GROUP BY
* HAVING
* ORDER BY

* WHERE expression example (can use AND/OR and operators too):
```
... WHERE column = 'term';

... WHERE animal = 'Chicken' AND colour = 'Brown';

...	WHERE price > 20 AND price <= 100;
```

* TOP answers don't need to have used the order by and limit expression like in PostgreSQL:
```
SELECT TOP 5 column_name, column_two FROM table_name
WHERE conditions;
```

* DISTINCT removes duplicates. Basically UNIQUE:
```
SELECT DISTINCT column FROM table_name ...

SELECT COUNT(DISTINCT column) FROM table_name ...
```

* Wildcards (often use a LIKE part too):
	* * - everything
	* % - substitute for =>0 characters
	* _ - substitute for a single character
	* [charlist] - sets and ranges of characters to match
		* .e.g. LIKE [ABVZ]%
	* [^charlist] - sets and ranges that don't match

* IN acts as a mini array type of thing in MSSQL:
```
SELECT * FROM table WHERE column IN ('LA, CP');
```

* BETWEEN is another way to make a range:
```
... WHERE column BETWEEN 10 AND 1029;
```

* AS can change the column names in the output:
```
SELECT column_name AS 'Column Name' FROM table_name;

SELECT column AS 'Column', column_two + ', ' + column_one AS 'Column-Two' FROM table_name;
```
```
