CREATE TABLE company(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name TEXT NOT NULL,
	phone VARCHAR(15) NOT NULL,
	email VARCHAR(255) NOT NULL,
	fax VARCHAR(15) NOT NULL,
	address TEXT NOT NULL
)

CREATE TABLE author(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name TEXT NOT NULL,
	dob DATE,
	address TEXT,
	gender ENUM('MALE','FEMALE')
)

CREATE TABLE book(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	release_year YEAR NOT NULL,
	id_company INT,
	img TEXT,
	FOREIGN KEY(id_company) REFERENCES company(id)
)

CREATE TABLE book_author(
	id_book INT,
	id_author INT,
	PRIMARY KEY (id_book, id_author),
	FOREIGN KEY (id_book) REFERENCES book(id),
	FOREiGN KEY (id_author) REFERENCES author(id) 
)

CREATE TABLE category(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name_category TEXT,
	description TEXT
)

CREATE TABLE book_category(
	id_book INT,
	id_category INT,
	PRIMARY KEY (id_book, id_category),
	FOREIGN KEY (id_book) REFERENCES book(id),
	FOREIGN KEY (id_category) REFERENCES category(id)
)
