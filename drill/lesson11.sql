--11-1

A ACID特性
B　制約
C　永続的
D　ログファイル
E　ロールフォワード

--11-2

CREATE VIEW 学部名付き学生　AS
SELECT S.学籍番号,S.名前, S.生年月日,S.血液型,
       S.学部ID,B.名前 AS 学部名
  FROM 学生　AS S 
  JOIN 学部　AS B
    ON S.学部ID = B.学部ID

INSERT INTO 学生
  (学生番号, 名前、生年月日、血液型、学部ID、登録順)
VALUES
  ('B1101022','小島','1993-02-12','A','K')          