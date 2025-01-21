WITH RECURSIVE P AS (SELECT ID, 1 AS GENERATION
                    FROM ECOLI_DATA
                    WHERE PARENT_ID IS NULL
                    UNION ALL
                    SELECT C.ID, P.GENERATION + 1 AS GENERATION
                    FROM ECOLI_DATA AS C
                    JOIN P
                    ON C.PARENT_ID = P.ID)
SELECT COUNT(ID) AS COUNT , GENERATION
FROM P
WHERE ID NOT IN (SELECT DISTINCT PARENT_ID
                FROM ECOLI_DATA
                WHERE PARENT_ID IS NOT NULL)
GROUP BY GENERATION
ORDER BY GENERATION;



WITH RECURSIVE P AS (SELECT ID, 1 AS GENERATION
                    FROM ECOLI_DATA
                    WHERE PARENT_ID IS NULL
                    UNION ALL
                    SELECT C.ID, P.GENERATION + 1 AS GENERATION
                    FROM ECOLI_DATA AS C
                    JOIN P
                    ON C.PARENT_ID = P.ID)
SELECT COUNT(ID) AS COUNT , GENERATION
FROM P
WHERE NOT EXISTS (SELECT 1
                FROM ECOLI_DATA AS C
                WHERE P.ID = C.PARENT_ID)
GROUP BY GENERATION
ORDER BY GENERATION;

-- NOT EXISTS (하위)
-- 하위 컬럼에 존재하지 않는 것만을 출력합니다.
-- NOT EXISTS 조건 해석
-- 	1.	SELECT 1이 반환된다면:
-- 	•	C.PARENT_ID = P.ID 조건을 만족하는 데이터가 존재한다는 뜻입니다.
-- 	•	이 경우 NOT EXISTS는 FALSE를 반환하며, 상위 쿼리에서 제외됩니다.

-- with recursive cte as(select 추출을 원하는 컬럼들, 1 as 반복문을 생성할 컬럼
-- 					  from 기본테이블
--                       where 재귀쿼리의 조건
-- union all 위 쿼리에 아래 쿼리 연산
-- 					  select 추출을 원하는 컬럼들, 1+반복문을 생성할 컬럼
--                       from cte 하나씩 불려 나감
--                       where 언제까지 반복할건데?)

-- 반복문을 생성할 컬럼명은 동일해야한다.