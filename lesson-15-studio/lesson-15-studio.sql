CREATE TABLE book (
   book_id INT AUTO_INCREMENT PRIMARY KEY,
   author_id INT,
   title VARCHAR(255),
   isbn INT,
   available BOOL,
   genre_id INT
);

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birthday DATE,
   deathday DATE
);

CREATE TABLE patron (
   patron_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   loan_id INT
);

CREATE TABLE reference_books (
   reference_id INT AUTO_INCREMENT PRIMARY KEY,
   edition INT,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

INSERT INTO reference_books(edition, book_id)
VALUE (5,32);

CREATE TABLE loan (
   loan_id INT AUTO_INCREMENT PRIMARY KEY,
   patron_id INT,
   date_out DATE,
   date_in DATE,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

CREATE TABLE genre (
   genre_id INT PRIMARY KEY,genre_id
   genres VARCHAR(100)
);

SELECT title, isbn FROM book 
INNER JOIN genre ON book.genre_id=genre.genre_id
WHERE genre.genres="Mystery";

SELECT title, first_name, last_name FROM book
INNER JOIN author ON author.author_id=book.author_id
WHERE author.deathday IS null;

UPDATE book 
SET available=0
WHERE book_id=1;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (1, '2024-02-01', 1);

UPDATE patron
SET loan_id=1
WHERE patron_id=1;

UPDATE book 
SET available=1
WHERE book_id=1;

UPDATE loan 
SET date_in='2024-02-01'
WHERE loan_id=1;

UPDATE patron
SET loan_id=null
WHERE patron_id=1;

UPDATE book 
SET available=0
WHERE book_id=2;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (2, '2024-02-01', 2);

UPDATE patron
SET loan_id=2
WHERE patron_id=2;

UPDATE book 
SET available=0
WHERE book_id=3;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (3, '2024-02-01', 3);

UPDATE patron
SET loan_id=3
WHERE patron_id=3;

UPDATE book 
SET available=0
WHERE book_id=4;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (4, '2024-02-01', 4);

UPDATE patron
SET loan_id=4
WHERE patron_id=4;

UPDATE book 
SET available=0
WHERE book_id=5;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (5, '2024-02-01', 5);

UPDATE patron
SET loan_id=5
WHERE patron_id=5;

UPDATE book 
SET available=0
WHERE book_id=6;

INSERT INTO loan (patron_id, date_out, book_id)
VALUES (6, '2024-02-01', 6);

UPDATE patron
SET loan_id=6
WHERE patron_id=6;

SELECT patron.last_name, patron.first_name, genre.genres FROM patron
INNER JOIN loan ON patron.loan_id=loan.loan_id
INNER JOIN book ON loan.book_id=book.book_id
INNER JOIN genre ON book.genre_id=genre.genre_id
WHERE patron.loan_id IS NOT null;