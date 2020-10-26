CREATE DATABASE booksareus;

CREATE TABLE user(
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
    release_data DATE,
    author VARCHAR(20)
);

CREATE TABLE loan(
    transaction_id INT NOT NULL IDENTITY PRIMARY KEY,
    loan_date DATE,
    price DECIMAL(5,2)
    -- probably a foreign key here for user
);
