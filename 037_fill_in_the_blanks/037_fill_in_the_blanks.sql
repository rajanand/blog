-- fill in the blanks

use testdb;
go

DROP TABLE IF EXISTS #Gaps;
DROP TABLE IF EXISTS #Gaps2;
GO

CREATE TABLE #Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100)
);
GO

INSERT INTO #Gaps VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,'Charlie'),(8,NULL),(9,NULL);
GO

--SELECT * INTO #Gaps2 FROM #Gaps;
--GO


--Solution 1
--SELECT within a SELECT with a Correlated Subquery
SELECT  a.RowNumber,
        (SELECT b.TestCase
        FROM    #Gaps b
        WHERE   b.RowNumber =
                    (SELECT MAX(c.RowNumber)
                    FROM #Gaps c
                    WHERE c.RowNumber <= a.RowNumber AND c.TestCase != '')) TestCase
FROM #Gaps a;

select a.TestCase
from #gaps as a

select max(row