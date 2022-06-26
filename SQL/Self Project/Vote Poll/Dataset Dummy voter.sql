CREATE TABLE voter
	(ID INT,
    first_name VARCHAR(10),
    last_name VARCHAR (10));

CREATE TABLE result(
	voter_id INT,
    country VARCHAR(10));
    

INSERT INTO voter(ID, first_name, last_name)
VALUES
	(1,'charlie','puth'),
    (2,'michael','jackson'),
    (3,'nicky','minaj');

INSERT INTO result(voter_id, country)
VALUES
	(1,'California'), 
    (1,'Texas'), 
    (2,'Mexico'), 
    (1,'Nevada'),
    (3,'Washington'),
    (2,'California'), 
    (3,'Mexico'),
    (3,'Texas'), 
    (1,'California'), 
    (2,'Mexico'); 
