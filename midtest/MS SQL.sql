WITH Sequences AS (
    SELECT
        num,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM
        input_table
)
SELECT DISTINCT num
FROM Sequences
GROUP BY num, grp
HAVING COUNT(*) >= 3
ORDER BY num ASC;