--  반올림 
-- Round(컬럼명) - 소수점 1번째 자리에서 반올림
-- Round(컬럼명,1) - 출력할 소수점 자리 지정 (123.45 -> 123.5)
-- ROUND(컬럼명, -1) - 10단위로 반올림 (123 -> 120)

-- CEIL(숫자) : 올림

-- TRUNCATE 버림
-- TRUNCATE(컬럼명,1) - 반드시 버릴 자릿수 명시

-- FLOOR 버림
-- FLOOR(컬럼명) - 소수점 아래 버림

SELECT ROUND(AVG(POPULATION))
FROM CITY;