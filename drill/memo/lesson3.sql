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
