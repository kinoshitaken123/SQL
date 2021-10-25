--2-1
A SELECT
B UPDATE
C DELETE
D INSERT
E FROM
F FROM
G INTO
H WHERE

--2-2
1 INTEGER
2
3 DATE
4
5 TIME
6
7

--2-3
1 SELECT 地域, 都道府県名, 県庁所在地, 面積 
  FROM 都道府県
2 SELECT *
  FROM 都道府県
3 SELECT 地域 AS area, 都道府県名 AS pref
  FROM 都道府県

--2-4
INSERT INTO 都道府県(コード、地域、都道府県、面積)
　VALUES ('26','近畿','京都',4613)

INSERT INTO 
　VALUES ('37','四国','香川',1873)

INSERT INTO 都道府県(コード、都道府県、県庁所在地)
　　VALUES('40','福岡','福岡')

--2-5
UPDATE 都道府県 SET 県庁所在地　= '京都'
　　WHERE コード　= '26'

UPDATE 都道府県 SET 地域　= '九州', 面積　= 4976
   WHERE コード　= '40'

--2-6
DELETE FROM 都道府県 WHERE コード　= '26'   