--8-1
1 A1 1 A2 3 B1 1 B2 2
2 A1 2 A2 4 B1 1 B2 2
3 A1 NULL A2 NULL B1 3 B2 NULL
4 A1 1 A2 3 B1 1 B2 2

--8-2
SELECT 社員番号,S.名前　AS 名前, B.名前 AS 部署名
  FROM 社員　AS S
  JOIN 部署　AS B
    ON S.部署ID = B.部署ID

  SELECT S1.社員番号,$1.名前,$2.　名前 AS 上司名
    FROM  社員　AS $1
    LEFT JOIN 社員　AS $2
    ON $1.上司ID　$2.社員番号

    SELECT 社員番号,$.名前 AS 名前、
           B.名前 AS 部署名,K.名前　AS 勤務地
    FROM
    JOIN
    ON
    JOIN
    ON       