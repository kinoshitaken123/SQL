--3-1
1 SELECT * FROM 気象観測 WHERE 月 = 6
2 SELECT * FROM 気象観測 WHERE 月 <> 6
4 SELECT * FROM 気象観測 WHERE 降水量　< 100
5 SELECT * FROM 気象観測 WHERE 降水量　> 200
6 SELECT * FROM 気象観測 WHERE 最高気温　>= 30
6 SELECT * FROM 気象観測 WHERE 最低気温　<= 0
7 SELECT * FROM 気象観測 WHERE 月　IN (3,5,7)
8 SELECT * FROM 気象観測 WHERE 月　NOT IN (3,5,7)
9 --降水量が100以下で温度が50より低いデータ
　SELECT * FROM 気象観測 
　　WHERE 降水量 <= 100 AND　湿度 < 50
10 --最低気温が５未満か、最高気温が35より高いデータ
 SELECT * FROM 気象観測
  WHERE 最低気温 < 5 OR 最高気温 > 35
11--湿度が60~79の範囲にあるデータ
 SELECT * FROM 気象観測
  WHERE 湿度 BETWEEN 60 AND 79
12--観測データのない列のある月のデータ
 SELECT * FROM 気象観測
 　WHERE 降水量 IS NULL OR 最高気温　IS NULL
    OR 最低気温　IS NULL OR 湿度 IS NULL

--3-2
1 都道府県名が川で終わる都道県名
 SELECT 都道府県名
 FROM 都道府県
 WHERE 都道府県名 LIKE '%川'

2 都道府県名に島が含まれる都道県名
SELECT 都道府県名
FROM 都道府県
WHERE 都道府県名 LIKE '%島%'

3 都道府県名が愛で始まる都道県名
SELECT 都道府県名
FROM 都道府県
WHERE 都道府県名 LIKE '愛%'

4 都道府県名と県庁所在が一致するデータ
SELECT * 都道府県
 WHERE 都道府県名 = 県庁所在

5 都道府県名と県庁所在地が一致しないデータ  
SELECT * 都道府県
 WHERE 都道府県名 <> 県庁所在

--3-3
1 SELECT * FROM 成績表

2 /* 学籍番号S001の学生*/
INSERT INTO 成績表
VALUES ('$001', '織田信長',77 ,55,80,75,93,NULL)

/* 学籍番号S002の学生*/
INSERT INTO 成績表
VALUES ('$002','豊臣秀吉',64,69,70,0,59,NULL)

/* 学籍番号S003の学生*/
INSERT INTO 成績表
VALUES ('$003','徳川家康',80,83,85,90,79,NULL)

3 UPDATE 成績表 SET 法学 = 85, 数学 = 67
 WHERE 学籍番号 = '$001'

4 --2で登録した学籍番号A002の学生と学籍番号E003の学生の外国語を８１に修正する。
  UPDATE  成績表 SET 外国語 = 81
   WHERE 学籍番号 IN ('A002','E003')

5
 (1)全科目が８０以上の学生は「A」とする
 　UPDATE 成績表 SET 総合成績 = 'A'
   WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80 AND 情報理論 >= 80 AND 外国語 >= 80

 (2)法学、外国語のどちらかが80以上で、経済学、哲学のどちらかが80以上の学生は「B」
   UPDATE 成績表 SET 総合成績 = 'B'
   WHERE (　法学 >= 80 OR 外国語 >= 80)
   AND (経済学 >= 80 OR 哲学 >= 80)
   AND 総合成績 IS NULL

 (3)全科目が５０未満の学生はDとする
   UPDATE 成績表 SET 総合成績 = 'D'
    WHERE 法学 < 50 AND 経済学 < 50 AND 哲学 < 50
     AND 情報理論 < 50 AND 外国語 < 50
     AND 総合成績　IS NULL

 (4)それ以外の学生をCとする
    UPDATE 成績表 SET 総合成績 = 'C'
      WHERE 総合成績 IS NULL

6いずれかの科目に０がある学生を、成績表テーブルから削除する
 DELETE FROM 成績表
  WHERE 法学  = 0
   OR 経済学  = 0
   OR 哲学    = 0
   OR 情報理論 = 0
   OR 外国語　　=0
