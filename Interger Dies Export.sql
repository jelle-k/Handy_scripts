DECLARE tot int(100)
SET @tot = SELECT SUM(Quantity) FROM IPF1 WHERE DocEntry = 20448;

SELECT
T1.Quantity/@tot

FROM OIPF T0  

INNER JOIN IPF1 T1 ON T0.[DocEntry] = T1.[DocEntry] 

WHERE T0.[DocEntry] = 20448
