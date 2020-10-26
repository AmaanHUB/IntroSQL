# Introduction to SQL

## Introduction To Databases

### What Is A Database?

* Structured set of data
	* With tables to keep various pieces of data

#### Tables

Consists of columns (with column headers) and rows.

* Column - Correspond to the attributes of the object
* Row - One set of attributes to one instance that a table describes. AKA records or tuples
* Table - Predefined format of rows and columns that defines an entity. AKA a file
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

