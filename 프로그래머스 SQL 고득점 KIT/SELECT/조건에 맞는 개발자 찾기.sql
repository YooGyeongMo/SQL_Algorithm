-- BIT 연산 설명

-- 비트 연산은 숫자를 2진수로 표현하여 각 비트 단위로 AND, OR, XOR 등의 연산을 수행하는 것이다.
-- SQL에서는 주로 특정 비트가 설정되어 있는지 확인하는 데 사용된다.
-- BIT 연산의 예:

-- AND 연산 (&): 두 비트가 모두 1일 때만 1을 반환한다.
-- OR 연산 (|): 두 비트 중 하나라도 1이면 1을 반환한다.
-- XOR 연산 (^): 두 비트가 다르면 1, 같으면 0을 반환한다.
-- NOT 연산 (~): 비트를 반전시킨다.

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT CODE
                   FROM SKILLCODES
                   WHERE NAME = 'Python')
OR
      SKILL_CODE & (SELECT CODE
                   FROM SKILLCODES
                   WHERE NAME = 'C#')
ORDER BY ID ASC;


-- 비트연산은 True False로 나오는데 
-- 해당 문제에서 python 은 256 - 10000000
-- C# 은 1024 - 1000000000 인데 
-- AND 연산을 하면 해당인 비트만 켜지기에 포함되었는지 아닌지 알 수 있습니다.
-- 없다면 False가 될 것이기 때문이죠