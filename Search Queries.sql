SELECT T1.CatName,
	T0.QName,
	T0.Qstring
FROM OUQR T0
INNER JOIN OQCN T1 ON T0.QCategory = T1.CategoryId
WHERE T0.QName LIKE '%[%0]%'
ORDER BY 1
