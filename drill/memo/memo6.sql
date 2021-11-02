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

 --グループ化して集計する基本構文
 SELECT グループ化の基準列名・・・、集計関数
   FROM テーブル名
   (WHERE 絞り込み条件)
 GROUP BY グループ化の基準列名  

 --グループ化してから絞り込む基本構文
 SELECT グループ化の基準列名、集計関数
   FROM テーブル名
GROUP BY グループ化の基準列名
  HAVING 集計結果に対する絞り込み条件   

  --集計結果で絞り込む
  SELECT 費目、SUM(出金額)　AS 費目別の出金額合計
  　FROM　家計簿
  GROUP BY 費目
  　HAVING SUM(出金額)　> 0