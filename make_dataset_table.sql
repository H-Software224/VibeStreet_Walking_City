USE BDA_K_HTML_DB;
WITH table_1 AS (
	SELECT B.TREE_NAME
			, B.PARK_NAME
			, A.ADDRESS
    FROM `seoul_dongdaemungo_crossinformation` AS A
    LEFT JOIN `seoul_dongdaemungo_parktreeinformation` AS B ON A.ADDRESS = B.ADDRESS
), table_2 AS (
	SELECT D.TREE_NAME
			, D.PARK_NAME
            , C.ADDRESS
    FROM `seoul_dongdaemungo_parkinformation` AS C
    LEFT JOIN `seoul_dongdaemungo_parktreeinformation` AS D ON C.ADDRESS = D.ADDRESS
), last_table AS (
	SELECT * FROM table_1
    UNION ALL
    SELECT * FROM table_2
)
SELECT * FROM last_table;