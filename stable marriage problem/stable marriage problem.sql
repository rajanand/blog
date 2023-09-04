USE TestDb;
--stable marriage problem

--CREATE TABLE Husbands
--(man CHAR(5) NOT NULL,
-- woman CHAR(5) NOT NULL,
-- ranking INTEGER NOT NULL CHECK (ranking > 0),
-- PRIMARY KEY (man, woman));

-- CREATE TABLE Wives
--(woman CHAR(5) NOT NULL,
-- man CHAR(5) NOT NULL,
-- ranking INTEGER NOT NULL CHECK (ranking > 0),
-- PRIMARY KEY (man, woman)); --INSERT INTO Husbands VALUES ('Abe', 'Joan', 1);
--INSERT INTO Husbands VALUES ('Abe', 'Kathy', 2);
--INSERT INTO Husbands VALUES ('Abe', 'Lynn', 3);
--INSERT INTO Husbands VALUES ('Abe', 'Molly', 4);
--INSERT INTO Husbands VALUES ('Bob', 'Joan', 3);
--INSERT INTO Husbands VALUES ('Bob', 'Kathy', 4);
--INSERT INTO Husbands VALUES ('Bob', 'Lynn', 2);
--INSERT INTO Husbands VALUES ('Bob', 'Molly', 1);
--INSERT INTO Husbands VALUES ('Chuck', 'Joan', 3);
--INSERT INTO Husbands VALUES ('Chuck', 'Kathy', 4);
--INSERT INTO Husbands VALUES ('Chuck', 'Lynn', 2);
--INSERT INTO Husbands VALUES ('Chuck', 'Molly', 1);
--INSERT INTO Husbands VALUES ('Dave', 'Joan', 2);
--INSERT INTO Husbands VALUES ('Dave', 'Kathy', 1);
--INSERT INTO Husbands VALUES ('Dave', 'Lynn', 3);
--INSERT INTO Husbands VALUES ('Dave', 'Molly', 4);

--INSERT INTO Wives VALUES ('Joan', 'Abe', 1);
--INSERT INTO Wives VALUES ('Joan', 'Bob', 3);
--INSERT INTO Wives VALUES ('Joan', 'Chuck', 2);
--INSERT INTO Wives VALUES ('Joan', 'Dave', 4);
--INSERT INTO Wives VALUES ('Kathy', 'Abe', 4);
--INSERT INTO Wives VALUES ('Kathy', 'Bob', 2);
--INSERT INTO Wives VALUES ('Kathy', 'Chuck', 3);
--INSERT INTO Wives VALUES ('Kathy', 'Dave', 1);
--INSERT INTO Wives VALUES ('Lynn', 'Abe', 1);
--INSERT INTO Wives VALUES ('Lynn', 'Bob', 3);
--INSERT INTO Wives VALUES ('Lynn', 'Chuck', 4);
--INSERT INTO Wives VALUES ('Lynn', 'Dave', 2);
--INSERT INTO Wives VALUES ('Molly', 'Abe', 3);
--INSERT INTO Wives VALUES ('Molly', 'Bob', 4);
--INSERT INTO Wives VALUES ('Molly', 'Chuck', 1);
--INSERT INTO Wives VALUES ('Molly', 'Dave', 2);select * from husbands where man='abe' and woman='joan'select * from wives where man='abe' and woman='joan'