-- #ROW_NUMBER() OVER(ORDER BY )
-- #RANK() OVER (ORDER BY)
-- #DENSE_RANK() OVER (ORDER BY)

-- ROW_NUMBER()는 ()안의 ORDER BY를 먼저하고 일련번호를 1번부터 붙인다.
-- RANK()는 ()안의 ORDER BY를 먼저하고 순위를 매긴다 예를들어 ORDER BY안의 숫자가 같은게 4위라면 4위가 두개다.
-- RANK()는 바로 이웃한 랭크를 뱉지않고 4가 두개이므로 다음 순위는 6위이다.
-- 이때 이웃된 순위로 바꾸는 법이 DENSE_RANK() 이다.
WITH PIVOT_T AS (
    SELECT NAME,OCCUPATION, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY NAME ) AS ROWNUM
    FROM OCCUPATIONS
)

SELECT MAX(CASE WHEN Occupation = 'Doctor' THEN NAME END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN NAME END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN NAME END) AS Actor
FROM PIVOT_T
GROUP BY ROWNUM
ORDER BY ROWNUM;

-- - #ROW_NUMBER() OVER(ORDER BY )
--   - ROW_NUMBER()는 ()안의 ORDER BY를 먼저하고 일련번호를 1번부터 붙인다.
-- - #RANK() OVER (ORDER BY)
--   - RANK()는 ()안의 ORDER BY를 먼저하고 순위를 매긴다 예를들어 ORDER BY안의 숫자가 같은게 4위라면 4위가 두개다.
--   - RANK()는 바로 이웃한 랭크를 뱉지않고 4가 두개이므로 다음 순위는 6위이다.
-- - #DENSE_RANK() OVER (ORDER BY)
--   - 이때 이웃된 순위로 바꾸는 법이 DENSE_RANK() 이다.


-- - 여기서 PARTITION이 있는데, 
--   - ROW_NUMBER() OVER (PARTITION BY 열 ORDER BY 열 ) 하면
--   -  PARTITION 하면 열을 그룹화 시켜서 ORDER BY 열기준으로 하고 ROW_NUMBER()를 차례대로 한다.


--  서브쿼리

SELECT MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) AS Doctor,
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) AS Professor,
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) AS Singer,
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) AS Actor
FROM (
    SELECT NAME,OCCUPATION,ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS ROWNUM
    FROM OCCUPATIONS
) AS TEMP
GROUP BY ROWNUM
ORDER BY ROWNUM;