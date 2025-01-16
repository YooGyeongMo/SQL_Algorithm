SELECT COUNT(GENOTYPE) AS COUNT
FROM ECOLI_DATA
WHERE GENOTYPE & 2 = 0 AND ( GENOTYPE & 1 = 1 OR GENOTYPE & 4 = 4 );

-- 비트연산 시에 m & n = 0 이 의미하는 바는 n의 2진수 비트수가 켜지지 않는다를 의미.
-- = 뒤에 오는 숫자는 십진수로 켜지냐 아니냐를 의미할 때 하는거다.