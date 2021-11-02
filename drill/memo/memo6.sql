--さまざまな集計をする
SELECT
   SUM(出金額) AS 合計出金額,
   AVG(出金額) AS 平均出金額,
   MAX(出金額) AS 最も大きな散財、
   MIN(出金額) AS 最も少額の支払い
FROM 家計簿   

--食費の桁数を数える
SELECT COUNT(*) AS 食費の行動
  FROM 家計簿
 WHERE 費目　= '食費' 

 --NULLをぜろとして平均を求める
 SELECT AVG(COALESCE(出金額,0)) AS 出金額の平均
 　FROM 家計簿