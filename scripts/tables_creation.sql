
-- KONFIO's exam 
CREATE TABLE LOANS.CUSTOMER (
	id INT NOT NULL /*AUTO_INCREMENT*/ PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	date_of_birth DATE DEFAULT NULL,
  	gender  VARCHAR(10) DEFAULT NULL,
	country VARCHAR(100) DEFAULT NULL,
  	created_date DATE DEFAULT  NULL
);

CREATE TABLE LOANS.LOAN_TYPE (
	id INT NOT NULL /*AUTO_INCREMENT*/ PRIMARY KEY,
	type VARCHAR(25) NOT NULL,
  created_date DATE DEFAULT NULL
);


CREATE TABLE LOANS.LOAN (
	id INT NOT NULL /*AUTO_INCREMENT*/ PRIMARY KEY,
	customer_id INT NOT NULL,
  	type_id INT NOT NULL,
	amount DECIMAL(5,4) NOT NULL,
  	created_date DATE DEFAULT NULL,
  	is_complete INT DEFAULT 0,
	FOREIGN KEY (customer_id) REFERENCES LOANS.CUSTOMER (id),
  	FOREIGN KEY (type_id) REFERENCES LOANS.LOAN_TYPE (id)
);

CREATE TABLE LOANS.PAYMENT (
	id INT NOT NULL /*AUTO_INCREMENT*/ PRIMARY KEY,
	loan_id INT NOT NULL,
	payment_number INT  NOT NULL,
	amount DECIMAL(5,4) NOT NULL,
  FOREIGN KEY (loan_id) REFERENCES LOANS.LOAN (id)
);




CREATE TABLE LOANS.LOAN2 (
	id INT NOT NULL /*AUTO_INCREMENT*/ PRIMARY KEY,
	customer_id INT NOT NULL,
  	type_id INT NOT NULL,
	amount DECIMAL(18,8) NOT NULL,
  	created_date DATE DEFAULT NULL,
  	is_complete INT DEFAULT 0,
	FOREIGN KEY (customer_id) REFERENCES LOANS.CUSTOMER (id),
  	FOREIGN KEY (type_id) REFERENCES LOANS.LOAN_TYPE (id)
);

--------------------------------
-- CREATE SEQUENCES
--------------------------------
            
CREATE SEQUENCE LOANS.SEQ_CUSTOMER INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE LOANS.SEQ_LOAN_TYPE INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE LOANS.SEQ_LOAN INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE LOANS.SEQ_PAYMENT INCREMENT BY 1 START WITH 1 MAXVALUE 9999999 MINVALUE 1 NOCACHE;
