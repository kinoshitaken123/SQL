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

  --今月の収入と支出の合計値を知りたい
  SELECT SUM(入金額),SUM(出金額) FROM 家計簿

  --今月の食費を支払った回数を知りたい
  SELECT COUNT(費目) AS 食費を支払った回数 FROM 家計簿
   WHERE 費目＝”食費”

  --先月までの水道光熱費で、最も高かった額と低い額を知りたい
  SELECT MAX(出金額) AS 最高額, MIN(出金額) AS 最低額
   FROM 家計簿アーカイブ WHERE 費目＝”水道光熱費

  --先月までの給料の平均額を知りたい
  SELECT AVG(入金額) AS 平均額　FROM 家計簿アーカイブ 
   WHERE 費目 = '給料'

  --先月までの費目ごとの出費額を知りたい。
  SELECT 費目, SUM(出金額)　AS 出金額
  　FROM 家計簿アーカイブ
  GROUP BY 費目

  --今月の出費のうち、平均が5,000円以上の費目とその最大限を知りたい
  SELECT 費目,MAX(出金額) AS 最大出金額 FROM 家計簿
  WHERE 出金額 > 0
  GROUP BY 費目
  HAVING AVG(出金額) >= 5000  