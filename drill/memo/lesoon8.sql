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

3.  SELECT 社員番号,$.名前 AS 名前、
           B.名前 AS 部署名,K.名前　AS 勤務地
    FROM 社員　AS S
    JOIN 部署　AS B
    ON S.部署ID = B.部署ID
    JOIN 支店 AS K
    ON S.勤務ID　= K.支店ID       

4.SELECT 支店ID AS 支店コード, K.名前 AS 支店名、
　        S.名前 AS 支店長名,T.社員数
    FROM 支店ID AS K
    JOIN 社員ID AS S
      ON K.支店長ID = S.社員番号
    JOIN(SELECT COUNT(*) AS 社員数,勤務地ID　
         FROM 社員 GROUP BY 勤務地ID) AS T     
      ON K.支店ID = T.勤務地ID

 5. SELECT $1.社員番号 AS 社員番号,K2.名前　AS 名前、
           K1.名前 AS 本人勤務地, K2.名前 AS 上司勤務地
      FROM 社員 AS　S1
        ON 社員 AS $2 
       AND S1.上司ID = $2.社員番号
      JOIN　支店 AS K1
        ON S1.勤務地ID = K1.支店ID
      JOIN 支店 AS K2
        ON $2.勤務地ID　= K2.支店ID