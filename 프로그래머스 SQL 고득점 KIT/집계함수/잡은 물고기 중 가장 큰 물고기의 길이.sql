SELECT CONCAT(MAX(LENGTH),'cm') AS MAX_LENGTH
FROM FISH_INFO;


--CONCAT 함수

-- CONCAT(값1, 값2, 값3, ... 값N)

-- SELECT 
--         CONCAT('concat함수: ', '문자', '문자') AS test1,
--         CONCAT('concat함수: ', '문자', 1) AS test2,
--         CONCAT('concat함수: ', NULL) AS test3,
--         CONCAT(NULL, NULL) AS test4 ;
-- 같은 데이터 타입이나 다른 데이터 타입을 연결 시에는 가능하다. 하지만 

-- CONCAT에서 NULL값은 빈 문자열로 암시적으로 변환하고,

-- CONCAT에서 모두 NULL값을 인수로 넣으면 VARCHAR(1) 형식의 빈 문자열을 반환한다.

-- 타입이 과일인 과일의 이름을 한줄에 보고 싶다면 이 때 , GROUP_CONCAT을 사용할 수 있다.
SELECT type, 
       GROUP_CONCAT(name) AS '과일명'
  FROM fruits
 GROUP BY type;

 -- 중복 제거하고, 한행으로 합쳐서 거기에 해당하는 name을 열거로 문자열로 합침.

