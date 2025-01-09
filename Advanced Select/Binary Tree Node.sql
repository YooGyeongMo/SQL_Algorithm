SELECT N, 
(CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N NOT IN (SELECT DISTINCT P 
                      FROM BST 
                      WHERE P IS NOT NULL) THEN 'Leaf'
    ELSE 'Inner'
END)
FROM BST
ORDER BY N ASC;


-- # 2주차 평균 발생 건수 조회
-- # 집계 함수 사용할 때 AVG,날짜 함수 사용시에 데이터가 매일 들어가 있는 경우는 AVG 쓰면 /7함
-- # 그러나 몇개가 비어있는 경우 서브쿼리 사용 시 그 비어있는거 만큼 나누고 AVG하기에 일주일 평균에 맞지않음

-- # COALESCE(EVENT_COUNT, 0):
-- #• NULL 값을 0으로 처리하여 데이터가 없는 날도 평균 계산에 포함합니다.


SELECT N,
(CASE 
 WHEN P IS NULL THEN 'Root'
 WHEN N IN (SELECT P
           FROM BST
           WHERE P IS NOT NULL) THEN 'Inner'
 ELSE 'Leaf'
END) AS Result
FROM BST
ORDER BY N ASC;