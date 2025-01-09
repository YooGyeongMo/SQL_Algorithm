SELECT COMPANY_CODE, FOUNDER,
(SELECT COUNT(DISTINCT LEAD_MANAGER_CODE)
 FROM Lead_Manager AS L
WHERE C.COMPANY_CODE = L.COMPANY_CODE),
 (SELECT COUNT(DISTINCT SENIOR_MANAGER_CODE)
 FROM SENIOR_MANAGER AS S
 WHERE C.COMPANY_CODE = S.COMPANY_CODE),
 (SELECT COUNT(DISTINCT MANAGER_CODE)
 FROM MANAGER AS M
 WHERE M.COMPANY_CODE = C.COMPANY_CODE),
 (SELECT COUNT(DISTINCT EMPLOYEE_CODE)
 FROM EMPLOYEE AS E
 WHERE E.COMPANY_CODE = C.COMPANY_CODE)
FROM COMPANY AS C
ORDER BY C.COMPANY_CODE


--  만약 사전적 정렬이 아니라면 
--  ORDER BY CAST(SUBSTRING(C.COMPANY_CODE, 2) AS UNSIGNED) ASC;
--  CAST (타입형 AS 변환원하는 타입형)
-- UNSIGNED은 양수만 
-- SIGNED는 음수 포함

-- // 문자에서 숫자로 변환
-- SELECT CAST('123' AS UNSIGNED) AS test;
-- SELECT CAST('123' AS UNSIGNED) FROM DUAL;

-- // 숫자에서 문자로 변환
-- SELECT CAST(2 AS char(1)) AS test;
-- SELECT CAST(123 AS CHAR(3)) FROM DUAL;

-- // 문자 또는 숫자를 날짜 타입으로 변환
-- SELECT CAST(20230418 AS DATE) FROM DUAL; // 2023-04-18
-- SELECT CAST('20230418' AS DATE) FROM DUAL; // 2023-04-18


-- 최적 

SELECT c.company_code, 
c.founder, 
COUNT(DISTINCT e.lead_manager_code), 
COUNT(DISTINCT e.senior_manager_code), 
COUNT(DISTINCT e.manager_code), 
COUNT(DISTINCT e.employee_code)
FROM Company AS c
INNER JOIN Employee AS e
ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

-- LEFT 조인

SELECT 
    C.company_code,
    C.founder,
    COUNT(DISTINCT LM.lead_manager_code),
    COUNT(DISTINCT SM.senior_manager_code),
    COUNT(DISTINCT M.manager_code),
    COUNT(DISTINCT E.employee_code)
FROM Company C
	LEFT JOIN Lead_Manager LM ON C.company_code = LM.company_code
	LEFT JOIN Senior_Manager SM ON LM.lead_manager_code = SM.lead_manager_code
    LEFT JOIN Manager M ON SM.senior_manager_code = M.senior_manager_code
	LEFT JOIN Employee E ON M.manager_code = E.manager_code
GROUP BY 
    C.company_code,
    C.founder
ORDER BY C.company_code