WITH A1 AS (
	SELECT
		B.userid
		, B.sessionid
		, to_char(A.ts, 'YYYY-MM') as date
	FROM raw_data.session_timestamp A 
	LEFT JOIN raw_data.user_session_channel B ON A.sessionid = B.sessionid
)

SELECT 
	date
	, COUNT(DISTINCT userid)
FROM A1
GROUP BY 1
ORDER BY 1
