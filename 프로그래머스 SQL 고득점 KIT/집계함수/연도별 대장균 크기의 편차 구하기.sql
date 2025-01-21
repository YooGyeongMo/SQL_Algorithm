SELECT YEAR(B.DIFFERENTIATION_DATE) AS YEAR, (ABS(B.SIZE_OF_COLONY - MAX_TABLE.SC)) AS YEAR_DEV,B.ID
FROM ECOLI_DATA AS B
JOIN (SELECT YEAR(A.DIFFERENTIATION_DATE) AS Y, MAX(A.SIZE_OF_COLONY) AS SC
     FROM ECOLI_DATA AS A
     GROUP BY YEAR(A.DIFFERENTIATION_DATE)) AS MAX_TABLE
ON YEAR(B.DIFFERENTIATION_DATE) = MAX_TABLE.Y
ORDER BY YEAR,YEAR_DEV;