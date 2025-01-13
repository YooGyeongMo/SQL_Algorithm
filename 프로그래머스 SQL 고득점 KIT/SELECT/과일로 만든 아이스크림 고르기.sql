SELECT FA.FLAVOR
FROM FIRST_HALF AS FA 
JOIN ICECREAM_INFO AS II 
ON FA.FLAVOR = II.FLAVOR
WHERE FA.TOTAL_ORDER > 3000 AND II.INGREDIENT_TYPE = 'fruit_based'
ORDER BY FA.TOTAL_ORDER DESC;