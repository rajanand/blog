--create test data
CREATE TABLE NUMBERS (
   ID INTEGER
)
GO

INSERT INTO NUMBERS VALUES(1);
INSERT INTO NUMBERS VALUES(2);
INSERT INTO NUMBERS VALUES(3);
INSERT INTO NUMBERS VALUES(5);
INSERT INTO NUMBERS VALUES(8);
INSERT INTO NUMBERS VALUES(11);
INSERT INTO NUMBERS VALUES(12);
INSERT INTO NUMBERS VALUES(17);
INSERT INTO NUMBERS VALUES(19);
INSERT INTO NUMBERS VALUES(20);
INSERT INTO NUMBERS VALUES(21);
INSERT INTO NUMBERS VALUES(24);
INSERT INTO NUMBERS VALUES(25);
GO


DECLARE @min_num INT = (SELECT MIN(ID) FROM NUMBERS)
DECLARE @max_num INT = (SELECT MAX(ID) FROM NUMBERS)

;WITH SERIES(NUM) AS (
    SELECT @min_num
    UNION ALL
    SELECT NUM+1
    FROM SERIES 
    WHERE NUM <= @max_num
)
SELECT NUM FROM SERIES
EXCEPT
SELECT ID FROM NUMBERS ORDER BY NUM
GO

