CREATE TABLE LOANS.REPORTE1 AS 

SELECT ROUND(Q.NUMERO * 50/Q.TOTAL,3)||'%' PROMEDIO, 
Q.GENERO, 
Q.COMPLETADO,
Q.AÑO ,
Q.TOTAL, NUMERO

FROM 
	(SELECT COUNT(LN.IS_COMPLETE)                                 NUMERO,
		    DECODE(IS_COMPLETE, '1','COMPLETADO','NO COMPLETADO') COMPLETADO ,
			CU.GENDER   										  GENERO,
		    TO_CHAR(LN.CREATED_DATE, 'YYYY')                      "AÑO",
		   (
		    SELECT COUNT(LN1.IS_COMPLETE)                         TOTAL 
			FROM   LOANS.LOAN LN1
			INNER  JOIN  LOANS.CUSTOMER CU1
			ON     CU1.ID = LN1.CUSTOMER_ID
			WHERE 1=1
			AND TO_CHAR(LN1.CREATED_DATE, 'YYYY')= TO_CHAR(LN.CREATED_DATE, 'YYYY')

		) TOTAL 
		FROM LOANS.LOAN LN
		INNER JOIN  LOANS.CUSTOMER CU
		ON CU.ID= LN.CUSTOMER_ID

		GROUP BY GENDER,IS_COMPLETE,TO_CHAR(LN.CREATED_DATE, 'YYYY')
		ORDER BY TO_CHAR(LN.CREATED_DATE, 'YYYY')

) Q;


CREATE TABLE LOANS.REPORTE2 as
SELECT 
Q.*, 
"'AUTO'"+ "'MORTGAGE'"+ "'REVOLVING'"+ "'INSTALLMENTS'" TOTAL
FROM 
	(SELECT * FROM ( SELECT * FROM ( SELECT TO_CHAR(LN.CREATED_DATE, 'YYYYMM') FECHA,
										   LT.TYPE                             TIPO
									 FROM  LOANS.LOAN LN
									 INNER JOIN LOANS.LOAN_TYPE LT
									 ON LT.ID = LN.TYPE_ID
									) 
					)
	PIVOT 
		(
		   COUNT(TIPO)
		   FOR TIPO IN ('AUTO','MORTGAGE','REVOLVING','INSTALLMENTS')
		   
		)

	) Q;