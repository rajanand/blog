
SELECT 
SOUNDEX ('SQL') AS SQL, 
SOUNDEX ('Sequel') AS Sequel,
DIFFERENCE('SQL', 'Sequel') AS Similarity;  

SELECT 
SOUNDEX ('Michael Jackson') AS Michael_Jackson, 
SOUNDEX ('Mitchel Johnson') AS Mitchel_Johnson,
DIFFERENCE('Michael Jackson','Mitchel Johnson') AS Similarity;  

SELECT 
SOUNDEX ('Ramesh') AS Ramesh, 
SOUNDEX ('Suresh') AS Suresh,
DIFFERENCE('Ramesh','Suresh') AS Similarity;  

SELECT 
SOUNDEX ('Tamil') AS Tamil, 
SOUNDEX ('Malayalam') AS Malayalam,
DIFFERENCE('Tamil','Malayalam') AS Similarity;  
