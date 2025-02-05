SELECT FD.PRODUCT_ID AS PRODUCT_ID,
FD.PRODUCT_NAME AS PRODUCT_NAME,
(FD.PRICE *SUM(FO.AMOUNT)) AS TOTAL_SALES
FROM FOOD_PRODUCT AS FD
JOIN FOOD_ORDER AS FO
ON FD.PRODUCT_ID = FO.PRODUCT_ID
WHERE DATE_FORMAT(FO.PRODUCE_DATE,'%Y-%m') = '2022-05'
GROUP BY FD.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, PRODUCT_ID;



SELECT A.FLAVOR
FROM (
    SELECT * FROM FIRST_HALF
    UNION ALL
    SELECT * FROM JULY
    ) AS A
GROUP BY A.FLAVOR
ORDER BY SUM(A.TOTAL_ORDER) DESC
LIMIT 3