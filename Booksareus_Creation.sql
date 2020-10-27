CREATE DATABASE booksareus;

CREATE TABLE users(
    user_id INT NOT NULL IDENTITY PRIMARY KEY,
    email VARCHAR(20),
    phone_number VARCHAR(11),
    forename VARCHAR(20),
    surname VARCHAR(20)
);


CREATE TABLE eBook(
    ebook_id INT NOT NULL IDENTITY PRIMARY KEY,
    title VARCHAR(20),
    book_location VARCHAR(20),
    release_date DATE,
	book_summary VARCHAR(MAX) NOT NULL,
    author VARCHAR(20)
);

CREATE TABLE loan(
    transaction_id INT NOT NULL IDENTITY PRIMARY KEY,
    loan_date DATE,
    price DECIMAL(5,2)
    customer_id INT REFERENCES users(user_id),
    eBook_id INT REFERENCES eBook(ebook_id)
);
